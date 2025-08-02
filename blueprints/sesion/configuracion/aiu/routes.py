# Rutas de secciones
from . import aiu_bp
from flask import render_template, request, redirect, url_for, flash
from models.usuario import Usuario
from models import db
from flask_login import current_user, login_required


@aiu_bp.route('/', methods=['GET', 'POST'])
@login_required
def aiu():
    
    if request.method == 'POST':
        form = request.form
        user = Usuario.query.get(current_user.id_usuario)
        user.gastos = form.get('administracion', '')
        user.imprevistos = form.get('imprevistos', '')
        user.utilidad = form.get('utilidad', '')
        db.session.add(user)
        db.session.commit()
        flash('Actualización realizada correctamente', 'success')

        return redirect(url_for('aiu.aiu'))

    return render_template('aiu.html')
