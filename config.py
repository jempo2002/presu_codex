# Configuración general del proyecto
class Configuracion():

    SECRET_KEY = "MIXTER**34"

class DevelopmentConfig(Configuracion):
    DEBUG = True
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = ''
    MYSQL_DB = 'presucostosv2'

configuracion = {
    'development': DevelopmentConfig
    }