
from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from config import configuracion
from models import db
from flask_login import LoginManager
from flask_mail import Mail

# Inicializar la aplicación Flask
app = Flask(__name__)
# Cargar configuración
app.config.from_object(configuracion['development'])
# Configuración de la base de datos
app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+pymysql://{app.config['MYSQL_USER']}:{app.config['MYSQL_PASSWORD']}@{app.config['MYSQL_HOST']}/{app.config['MYSQL_DB']}"
# Desactivar la modificación de seguimiento de SQLAlchemy
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)

# Inicializar Mail
mail = Mail(app)


# Inicializar LoginManager
login_manager = LoginManager()
login_manager.init_app(app)


# Cargar usuario por id
from models.usuario import Usuario
@login_manager.user_loader
def load_user(user_id):
    return Usuario.query.get(int(user_id))


# Importar blueprints después de inicializar app y db
from blueprints.autenticacion import autenticacion_bp
from blueprints.registro import registro_bp
from blueprints.nosotros import nosotros_bp
from blueprints.sesion.configuracion.entidad import entidad_bp
from blueprints.sesion import sesion_bp
from blueprints.sesion.configuracion import configuracion_bp
app.register_blueprint(registro_bp)
app.register_blueprint(autenticacion_bp)
app.register_blueprint(nosotros_bp)
app.register_blueprint(entidad_bp)
app.register_blueprint(sesion_bp)
app.register_blueprint(configuracion_bp)

# Ruta principal
@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True, port=5001)
