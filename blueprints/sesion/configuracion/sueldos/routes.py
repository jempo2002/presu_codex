# Rutas de secciones
from . import sueldo_bp
from flask import render_template, request, redirect, url_for, flash
from blueprints.sesion.configuracion.sueldos.models.conf_mdo import conf_mdo

@sueldo_bp.route('/', methods=['GET', 'POST'])
def sueldos():
    if request.method == 'POST':
        # Procesar el formulario
        pass
    return render_template('prestaciones.html', **conf_mdo.as_dict())

@sueldo_bp.route('/parafiscales', methods=['GET'])
def parafiscales():
    return render_template('parafiscales.html')

@sueldo_bp.route('/factores', methods=['GET'])
def factores():
    return render_template('factores.html')
