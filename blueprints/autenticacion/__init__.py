# Blueprint de autenticación
from flask import Blueprint
autenticacion_bp = Blueprint('autenticacion', __name__, template_folder='templates')
from . import routes
