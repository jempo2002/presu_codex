# Blueprint de secciones
from flask import Blueprint
sueldo_bp = Blueprint('sueldo', __name__, template_folder='templates', static_folder='static')
from . import routes  # Importa las rutas al registrar el blueprint
