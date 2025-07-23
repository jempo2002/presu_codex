# Blueprint de secciones
from flask import Blueprint
aiu_bp = Blueprint('aiu', __name__ , template_folder='templates', static_folder='static')
from . import routes 


