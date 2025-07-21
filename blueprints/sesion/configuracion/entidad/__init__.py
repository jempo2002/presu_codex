# Blueprint de secciones
from flask import Blueprint
entidad_bp = Blueprint('entidad', __name__, template_folder='templates')
from . import routes