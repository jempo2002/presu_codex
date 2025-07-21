

from werkzeug.security import check_password_hash
from flask_login import UserMixin

class Usuario(UserMixin):
    def __init__(self, idCliente, corrCliente, contrasena, nomCliente="",apeCliente="",celCliente="",nomEmpresaUsuario="",nitEmpresaUsuario ="",logoEmpresaUsuario="",celEmpresaUsuario="",ciudad="",gastosAdmin="",	presuImprevistos="",utlilidad="",presuDotaciones="",presuIncapacidad="") -> None:

        self.id = idCliente
        self.corrCliente = corrCliente
        self.contrasena = contrasena
        self.nomCliente = nomCliente
        self.apeCliente = apeCliente
        self.celCliente = celCliente
        self.nomEmpresaUsuario = nomEmpresaUsuario
        self.nitEmpresaUsuario  = nitEmpresaUsuario 
        self.logoEmpresaUsuario = logoEmpresaUsuario
        self.celEmpresaUsuario = celEmpresaUsuario
        self.ciudad = ciudad
        self.gastosAdmin = gastosAdmin
        self.presuImprevistos = presuImprevistos
        self.utlilidad =utlilidad
        self.presuDotaciones = presuDotaciones
        self.presuIncapacidad =presuIncapacidad
    

    @classmethod
    def check_password(cls, hashed_password,contrasena): 
        return check_password_hash(hashed_password,contrasena)
