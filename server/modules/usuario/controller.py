from flask import jsonify, make_response, Blueprint, request

from modules.usuario.usuario import Usuario
from modules.usuario.dao import UsuarioDAO

app_usuario = Blueprint('usuario_blueprint', __name__)
app_name = 'usuarios'
dao_usuario = UsuarioDAO()

@app_usuario.route(f'/{app_name}/', methods=['GET'])
def get_usuario():
    usuarios = dao_usuario.get_all()
    data = [usuario.get_data_dict() for usuario in usuarios]
    return make_response(jsonify(data))

