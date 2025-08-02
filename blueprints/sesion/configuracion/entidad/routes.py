# Rutas de secciones
from . import entidad_bp
from flask_login import login_required, current_user
from models import db
from flask import render_template, request, redirect, url_for, flash
from models.usuario import Usuario

@entidad_bp.route('/', methods=['GET', 'POST'])
@login_required
def entidad():
    
    # Acceso a la entidad
    if request.method == 'POST':
        form = request.form
        user = Usuario.query.get(current_user.id_usuario)
        user.nombre = form.get('nombre_empresa','')
        user.direccion = form.get('direccion', '')
        user.departamento = form.get('departamento_empresa', '')
        user.ciudad = form.get('ciudad_empresa', '')
        user.telefono_empresa = form.get('celular_empresa', '')
        user.nit = form.get('nit', '')
        user.nombre_representante = form.get('nombre_representante', '')
        user.telefono_representante = form.get('celular_representante', '')
        user.logo = form.get('logo', '')
        
        # Verificar si el NIT ya está registrado para otro usuario
        empresa_existe = Usuario.query.filter(Usuario.nit == user.nit).first()
        if empresa_existe and empresa_existe.id_usuario != user.id_usuario:
            flash("El NIT ya está registrado para otro usuario, no pueden registrarse dos empresas con el mismo NIT", 'error')
            return redirect(url_for('entidad.entidad'))
        else:
            # Si no hay conflicto, actualizamos la entidad
            db.session.add(user)
            db.session.commit()
            return redirect(url_for('entidad.entidad'))
    return render_template('entidad.html')