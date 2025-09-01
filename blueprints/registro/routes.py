from flask import render_template, redirect, url_for, flash, request
from models.usuario import Usuario
from werkzeug.security import generate_password_hash
from models import db
from sqlalchemy.exc import SQLAlchemyError
from . import registro_bp
import re


 # Registro usuario usando SQLAlchemy
@registro_bp.route('/', methods=['GET', 'POST'])
def registro():
    if request.method == 'POST':
        nombre = request.form['nomCliente']
        correo = request.form['corrCliente']
        contrasena = request.form['contrasena']
        conf_contrasena = request.form.get('conf_contrasena', '')
        nit = re.sub(r'\D', '', request.form.get('nit', ''))

        if not nit or len(nit) > 10:
            flash("Número de identificación inválido", 'error')
            return render_template('registro.html')

        # Validar que las contraseñas coincidan
        if contrasena != conf_contrasena:
            flash("Las contraseñas no coinciden", 'error')
            return render_template('registro.html')

        # Verificar que el cliente no esté registrado
        existente = Usuario.query.filter_by(correo=correo).first()
        if existente:
            flash("¡Usuario ya Existe!", 'error')
            return render_template('registro.html')

        existente_nit = Usuario.query.filter_by(nit=nit).first()
        if existente_nit:
            flash("El número de identificación ya está registrado", 'error')
            return render_template('registro.html')
        try:
            nuevo_usuario = Usuario(
                correo=correo,
                contrasena=generate_password_hash(contrasena, method='scrypt'),
                nombre=nombre,
                telefono_empresa="",
                nombre_representante="",
                nit=nit,
                logo="",
                telefono_representante="",
                direccion="",
                departamento="",
                ciudad="",
                gastos=0,
                imprevistos=0,
                incapacidad=0,
                dotaciones=0,
                utilidad=0
            )
            db.session.add(nuevo_usuario)
            db.session.commit()
            flash("Registro exitoso. Ahora puedes iniciar sesión.", 'success')
            return redirect(url_for('autenticacion.iniciar_sesion'))
        except SQLAlchemyError as e:
            db.session.rollback()
            flash("Error al registrar usuario", 'error')
            return render_template('registro.html')
    # Si es GET, mostrar el formulario
    return render_template('registro.html')
