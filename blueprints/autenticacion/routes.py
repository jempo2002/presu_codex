from flask import render_template, redirect, url_for, flash, request, current_app
from flask_login import login_user, logout_user, login_required
from . import autenticacion_bp

from models.usuario import Usuario
import re
import time
import smtplib
from email.message import EmailMessage

RATE_LIMIT = {}


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


@autenticacion_bp.route('/auth/recuperar-correo', methods=['GET', 'POST'])
def recuperar_correo():
    if request.method == 'POST':
        ip = request.remote_addr
        now = time.time()
        if ip in RATE_LIMIT and now - RATE_LIMIT[ip] < 600:
            flash("Si existe una cuenta asociada, te enviaremos un correo con instrucciones. Revisa tu bandeja y spam.")
            return render_template('recuperar_correo.html')
        RATE_LIMIT[ip] = now

        nit = re.sub(r'\D', '', request.form.get('nit', ''))
        if nit and len(nit) <= 10:
            user = Usuario.query.filter_by(nit=nit).first()
            if user:
                try:
                    msg = EmailMessage()
                    msg['Subject'] = 'Recuperación de tu correo registrado'
                    msg['From'] = current_app.config.get('MAIL_FROM', 'no-reply@example.com')
                    msg['To'] = user.correo
                    texto = f"Tu correo registrado es: {user.correo}"
                    msg.set_content(texto)
                    msg.add_alternative(f"<p>{texto}</p>", subtype='html')
                    servidor = current_app.config.get('MAIL_SERVER', 'localhost')
                    puerto = current_app.config.get('MAIL_PORT', 25)
                    with smtplib.SMTP(servidor, puerto) as smtp:
                        smtp.send_message(msg)
                except Exception:
                    pass
        flash("Si existe una cuenta asociada, te enviaremos un correo con instrucciones. Revisa tu bandeja y spam.")
        return render_template('recuperar_correo.html')
    return render_template('recuperar_correo.html')

