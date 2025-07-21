from flask import Blueprint
sesion_bp=Blueprint('sesion',__name__,template_folder='templates', static_folder='static')
from . import routes
