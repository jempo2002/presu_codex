from flask import Blueprint

configuracion_bp = Blueprint(
    'configuracion',
    __name__,
    template_folder='templates',
    static_folder='static'
)

from . import routes  # Importa las rutas al registrar el blueprint