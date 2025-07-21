# Rutas de autenticación
from flask import render_template, redirect, url_for, flash, request
from flask_login import login_user, logout_user, login_required
from . import autenticacion_bp

from models.usuario import Usuario


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