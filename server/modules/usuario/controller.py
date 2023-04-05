from flask import jsonify, make_response, Blueprint, request

from modules.usuario.usuario import Usuario
from modules.usuario.dao import UsuarioDAO

app_usuario = Blueprint('usuario_blueprint', __name__)
app_name = 'usuario'
dao_usuario = UsuarioDAO()

@app_usuario.route(f'/{app_name}s/', methods=['GET'])
def get_usuario():
    usuarios = dao_usuario.get_all()
    data = [usuario.get_data_dict() for usuario in usuarios]
    return make_response(jsonify(data))

@app_usuario.route(f'/{app_name}/add/', methods=['POST'])
def save_usuario():
    data = request.get_json()
    usuario = Usuario(**data)
    if dao_usuario.salvar(usuario):
        return make_response(jsonify(data))
    return 404

@app_usuario.route(f'/{app_name}/<id>/', methods=['GET'])
def get_id(id):
    usuario = dao_usuario.get_by_id(id)
    data = usuario.get_data_dict()
    return make_response(jsonify(data))

