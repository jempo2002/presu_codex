
from models import db

class MDO(db.Model):
    __tablename__ = 'mdo'

    id_mdo = db.Column(db.Integer, primary_key=True, autoincrement=True)
    profesion_obrero = db.Column(db.String(100), nullable=False)
    factor_profesion = db.Column(db.Numeric(5, 2), nullable=True, default=1.00)
    especialidad = db.Column(db.String(50), nullable=True)
    factor_especialidad = db.Column(db.Numeric(5, 2), nullable=True, default=1.00)
    valor = db.Column(db.Numeric(12, 3), nullable=True)
    config_cuadrilla = db.Column(db.String(10), nullable=True)
    oficiales = db.Column(db.Integer, nullable=True, default=0)
    auxiliares = db.Column(db.Integer, nullable=True, default=0)
    fecha_creacion = db.Column(db.DateTime, server_default=db.func.current_timestamp())
    fecha_modificacion = db.Column(db.DateTime, server_default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    