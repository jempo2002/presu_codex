from flask import Blueprint
nosotros_bp = Blueprint('nosotros', __name__, template_folder='templates')

from . import routes
