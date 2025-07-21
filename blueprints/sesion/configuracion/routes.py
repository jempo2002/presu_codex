from . import configuracion_bp
from flask import render_template

@configuracion_bp.route('/configuracion')
def configuracion():
    return render_template('layout_configuracion.html')