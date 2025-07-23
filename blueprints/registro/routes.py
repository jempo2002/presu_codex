
from flask import render_template, redirect, url_for, flash, request, current_app
from itsdangerous import URLSafeTimedSerializer
from flask_mail import Message
from models.usuario import Usuario
from werkzeug.security import generate_password_hash
from models import db
from sqlalchemy.exc import SQLAlchemyError
from . import registro_bp


# Registro usuario usando SQLAlchemy
@registro_bp.route('/registro', methods=['GET', 'POST'])
def registro():
    if request.method == 'POST':
        nombre = request.form['nomCliente']
        correo = request.form['corrCliente']
        contrasena = request.form['contrasena']
        confirmar = request.form.get('confirmar_contrasena')

        if contrasena != confirmar:
            flash("Las contraseñas no coinciden", 'error')
            return render_template('registro.html')

        # Verificar que el cliente no esté registrado
        existente = Usuario.query.filter_by(correo=correo).first()
        if existente:
            flash("¡Usuario ya Existe!", 'error')
            return render_template('registro.html')
        try:
            nuevo_usuario = Usuario(
                correo=correo,
                contrasena=generate_password_hash(contrasena, method='scrypt'),
                nombre=nombre,
                apellido="",
                celular="",
                nombre_empresa="",
                nit=None,
                logo="",
                telefono_empresa="",
                direcion_empresa="",
                departamento="",
                ciudad="",
                gastos=0,
                imprevistos=0,
                incapacidad=0,
                dotaciones=0,
                utlilidad=0,
                activo=False
            )
            db.session.add(nuevo_usuario)
            db.session.commit()
            serializer = URLSafeTimedSerializer(current_app.config['SECRET_KEY'])
            token = serializer.dumps(correo, salt='email-confirm')
            enlace = url_for('registro.confirmar_email', token=token, _external=True)
            msg = Message('Confirma tu cuenta', recipients=[correo])
            msg.body = f'Confirma tu cuenta visitando: {enlace}'
            mail = current_app.extensions.get('mail')
            if mail:
                mail.send(msg)
            print(f"Enlace de confirmación para {correo}: {enlace}")
            flash('Registro exitoso. Revisa tu correo para activar la cuenta.', 'success')
            return redirect(url_for('autenticacion.iniciar_sesion'))
        except SQLAlchemyError as e:
            db.session.rollback()
            flash("Error al registrar usuario", 'error')
            return render_template('registro.html')
    # Si es GET, mostrar el formulario
    return render_template('registro.html')


@registro_bp.route('/confirmar/<token>')
def confirmar_email(token):
    serializer = URLSafeTimedSerializer(current_app.config['SECRET_KEY'])
    try:
        correo = serializer.loads(token, salt='email-confirm', max_age=3600)
    except Exception:
        flash('El enlace no es válido o ha expirado', 'error')
        return redirect(url_for('registro.registro'))

    usuario = Usuario.query.filter_by(correo=correo).first()
    if usuario:
        if not usuario.activo:
            usuario.activo = True
            db.session.commit()
            flash('Cuenta activada correctamente', 'success')
        else:
            flash('Cuenta ya activada', 'info')
    else:
        flash('Usuario no encontrado', 'error')
    return redirect(url_for('autenticacion.iniciar_sesion'))
