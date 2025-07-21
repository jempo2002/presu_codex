
from models.usuario import Usuario
from werkzeug.security import check_password_hash


class Modelo_usuario:
    @classmethod
    def login(cls, correo, contrasena):
        user = Usuario.query.filter_by(correo=correo).first()
        if user and check_password_hash(user.contrasena, contrasena):
            return user
        return None

    @classmethod
    def get_by_id(cls, id_usuario):
        return Usuario.query.get(id_usuario)