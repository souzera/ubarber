from flask import jsonify, make_response, Blueprint, request

from modules.cliente.dao import ClienteDAO

app_cliente = Blueprint('cliente_blueprint', __name__)
app_name = 'cliente'
dao_cliente = ClienteDAO()

@app_cliente.route(f'/{app_name}s/', methods=['GET'])
def get_clientes():
    clientes = dao_cliente.get_all()
    data = [cliente.get_data_dict() for cliente in clientes]
    return make_response(jsonify(data))

@app_cliente.route(f'/{app_name}/<id>/', methods=['GET'])
def get_cliente_id(id):
    cliente = dao_cliente.get_by_id(id)
    data = cliente.get_data_dict()
    return make_response(jsonify(data))
