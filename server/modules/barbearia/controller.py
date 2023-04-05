from flask import jsonify, make_response, Blueprint, request

from modules.barbearia.dao import BarbeariaDAO as dao_barbearia

app_barbearia = Blueprint('barbearia_blueprint', __name__)
app_name = 'barbearia'

@app_barbearia.route(f'/{app_name}s/')
def get_barbearias():
    barbearias = dao_barbearia.get_all()
    data = [barbearia.get_data_dict() for barbearia in barbearias]
    return make_response(jsonify(data))

@app_barbearia.route(f'/{app_name}/<id>')
def get_barbearia_id(id):
    barbearia = dao_barbearia.get_by_id(id)
    data = barbearia.get_data_dict()
    return make_response(jsonify(data))