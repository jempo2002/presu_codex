# Configuración general del proyecto
class Configuracion():

    SECRET_KEY = "MIXTER**34"

class DevelopmentConfig(Configuracion):
    DEBUG = True
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = ''
    MYSQL_DB = 'presucostosv2'
    MAIL_SERVER = 'localhost'
    MAIL_PORT = 25
    MAIL_USERNAME = ''
    MAIL_PASSWORD = ''
    MAIL_USE_TLS = False
    MAIL_USE_SSL = False

configuracion = {
    'development': DevelopmentConfig
    }