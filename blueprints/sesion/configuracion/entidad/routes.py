# Rutas de secciones
from . import entidad_bp
from flask_login import login_required, current_user
from models import db
from models.modelo_usuario import Modelo_usuario
from flask import render_template, request, redirect, url_for, flash
from models.usuario import Usuario

@entidad_bp.route('/entidad', methods=['GET', 'POST'])
@login_required
def entidad():
    print("Accediendo a la entidad")
    if request.method == 'POST':
        form = request.form
        user = Usuario.query.get(current_user.id)
        user.nombre = form.get('nombre_empresa','')
        user.direccion = form.get('direccion', '')
        user.departamento = form.get('departamento', '')
        user.ciudad = form.get('ciudad', '')
        user.telefono_empresa = form.get('celular_empresa', '')
        user.nit = form.get('nit', '')
        user.nombre_representante = form.get('nombre_representante', '')
        user.telefono_representante = form.get('celular_representante', '')
        user.logo = form.get('logo', '')

        print("Datos de la entidad:")
        print(f"Nombre: {user.nombre}")
        print(f"Dirección: {user.direccion}")
        print(f"Departamento: {user.departamento}")
        print(f"Ciudad: {user.ciudad}")
        print(f"Teléfono: {user.telefono_empresa}")
        print(f"NIT: {user.nit}")
        print(f"Contacto: {user.nombre_representante}")
        print(f"Teléfono Contacto: {user.telefono_representante}")
        print(f"Logo: {user.logo}")

        empresa_existe = Usuario.query.filter(Usuario.nit == user.nit).first()
        if empresa_existe and empresa_existe.id != user.id:
            flash("El NIT ya está registrado para otro usuario, no pueden registrarse dos empresas con el mismo NIT", 'error')
            return redirect(url_for('entidad.entidad'))
        else:
            print("Guardando cambios en la entidad")
            db.session.add(user)
            db.session.commit()
            flash('Entidad actualizada correctamente', 'success')
            return redirect(url_for('entidad.entidad'))
    return render_template('entidad.html')