# Rutas de autenticación
from flask import render_template, redirect, url_for, flash, request
from flask_login import login_user, logout_user, login_required
from . import autenticacion_bp

from models.usuario import Usuario
from models import db
from werkzeug.security import generate_password_hash
from itsdangerous import URLSafeTimedSerializer

serializer = URLSafeTimedSerializer('MIXTER**34')

@autenticacion_bp.route('/iniciar_sesion', methods=['GET', 'POST'])
def iniciar_sesion():
    return render_template('iniciar_sesion.html')


@autenticacion_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        correo = request.form['corrCliente']
        contrasena = request.form['contrasena']
        user = Usuario.query.filter_by(correo=correo).first()
        if user and user.contrasena and user.contrasena != "":
            from werkzeug.security import check_password_hash
            if check_password_hash(user.contrasena, contrasena):
                if not user.activo:
                    flash('Debes activar tu cuenta mediante el enlace enviado a tu correo', 'error')
                    return render_template('iniciar_sesion.html')
                login_user(user)
                return redirect(url_for('entidad.entidad'))
            else:
                flash("Contraseña Incorrecta")
        else:
            flash("Usuario no Existe")
        return render_template('iniciar_sesion.html')
    return render_template('registro.html')


@autenticacion_bp.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('main.index'))


@autenticacion_bp.route('/restablecer_contrasena', methods=['GET', 'POST'])
def restablecer_contrasena():
    if request.method == 'POST':
        correo = request.form['correo']
        usuario = Usuario.query.filter_by(correo=correo).first()
        if usuario:
            token = serializer.dumps(correo, salt='password-reset')
            enlace = url_for('autenticacion.crear_contrasena', token=token, _external=True)
            print(f"Enlace de restablecimiento para {correo}: {enlace}")
            flash('Se ha enviado un enlace a tu correo.', 'success')
        else:
            flash('Correo no encontrado', 'error')
    return render_template('restablecer_contrasena.html')


@autenticacion_bp.route('/crear_contrasena/<token>', methods=['GET', 'POST'])
def crear_contrasena(token):
    try:
        correo = serializer.loads(token, salt='password-reset', max_age=3600)
    except Exception:
        flash('El enlace no es válido o ha expirado', 'error')
        return redirect(url_for('autenticacion.restablecer_contrasena'))

    if request.method == 'POST':
        nueva = request.form['nueva']
        confirma = request.form['confirma']
        if nueva != confirma:
            flash('Las contraseñas no coinciden', 'error')
        else:
            usuario = Usuario.query.filter_by(correo=correo).first()
            if usuario:
                usuario.contrasena = generate_password_hash(nueva, method='scrypt')
                db.session.commit()
                flash('Contraseña actualizada', 'success')
                return redirect(url_for('autenticacion.iniciar_sesion'))
    return render_template('crear_contrasena.html')
