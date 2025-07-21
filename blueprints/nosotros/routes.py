from . import nosotros_bp
from flask import render_template

@nosotros_bp.route('/nosotros')
def nosotros():
    return render_template('nosotros.html')