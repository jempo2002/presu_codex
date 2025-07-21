from . import sesion_bp
from .models.municipios import Municipio
from models import db
from flask import jsonify, request

@sesion_bp.route('/get_municipios', methods=['GET'])
def get_municipios():
        departamento = request.args.get('departamento')
        departamento = Municipio.query.filter_by(departamento=departamento).all()
        print(f"Consultando municipios para el departamento: {departamento}") 
        # Convertir los objetos a una lista de nombres
        municipios_lista = [m.municipio for m in departamento]         
        return jsonify({'municipios': municipios_lista})
             
             