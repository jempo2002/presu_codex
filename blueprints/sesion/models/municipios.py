from models import db

class Municipio(db.Model):
    __tablename__ = 'reg_colombia'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    municipio = db.Column(db.String(255), nullable=False)
    departamento = db.Column(db.String(255), nullable=False)

    def __repr__(self):
        return f"<Municipio {self.municipio} ({self.departamento})>"