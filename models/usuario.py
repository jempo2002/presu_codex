from models import db

class Usuario(db.Model):
    __tablename__ = 'usuarios'
<<<<<<< HEAD
    # En la BD existente la PK es 'id_usuario' (no 'id')
    id_usuario = db.Column('id_usuario', db.Integer, primary_key=True, autoincrement=True)
=======
    id_usuario = db.Column(db.Integer, primary_key=True, autoincrement=True)
>>>>>>> 2fc4372c05a85e32bcc9373ed05295a3d7bd9c00
    correo = db.Column(db.String(25), nullable=False, index=True)
    contrasena = db.Column(db.String(255), nullable=False)
    nombre = db.Column(db.String(50), nullable=False)
    telefono_empresa = db.Column(db.String(10), nullable=False)
    nombre_representante = db.Column(db.String(50), nullable=False)
    nit = db.Column(db.Integer, nullable=True, index=True)
    logo = db.Column(db.String(50), nullable=False)
    telefono_representante = db.Column(db.String(10), nullable=False)
    direccion = db.Column(db.String(50), nullable=False)
    departamento = db.Column(db.String(20), nullable=True)
    ciudad = db.Column(db.String(20), nullable=True)
    gastos = db.Column(db.Integer, nullable=False)
    imprevistos = db.Column(db.Integer, nullable=False)
    incapacidad = db.Column(db.Integer, nullable=False)
    dotaciones = db.Column(db.Integer, nullable=False)
    utilidad = db.Column(db.Integer, nullable=False)

    @property
    def is_authenticated(self):
        return True

    @property
    def is_active(self):
        return True

    @property
    def is_anonymous(self):
        return False

    def get_id(self):
<<<<<<< HEAD
        # Flask-Login usa este valor como identificador del usuario
=======
>>>>>>> 2fc4372c05a85e32bcc9373ed05295a3d7bd9c00
        return str(self.id_usuario)
