from flask import jsonify, make_response, Blueprint, request

from modules.atividade.dao import AtividadeDAO as dao_atividade

app_atividade = Blueprint('atividade_blueprint', __name__)
app_name = 'atividade'

@app_atividade.route(f'/{app_name}s/', methods=['GET'])
def get_atividades():
    atividades = dao_atividade.get_all()
    data = [atividade.get_data_dict() for atividade in atividades]
    return make_response(jsonify(data))

@app_atividade.route(f'/{app_name}/<id>', methods=['GET'])
def get_atividade(id):
    atividade = dao_atividade.get_by_id(id)
    data = atividade.get_data_dict()
    return make_response(jsonify(data))

@app_atividade.route(f'/{app_name}/cliente/<cliente_id>', methods=['GET'])
def get_atividade_cliente(cliente_id):
    atividades = dao_atividade.get_by_client(cliente_id)
    data = [atividade.get_data_dict() for atividade in atividades]
    return make_response(jsonify(data))

@app_atividade.route(f'/{app_name}/barbearia/<barbearia_id>', methods=['GET'])
def get_atividade_cliente(barbearia_id):
    atividades = dao_atividade.get_by_client(barbearia_id)
    data = [atividade.get_data_dict() for atividade in atividades]
    return make_response(jsonify(data))