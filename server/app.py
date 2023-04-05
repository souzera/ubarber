from flask import Flask

from modules.atividade.controller import app_atividade
from modules.barbearia.controller import app_barbearia
from modules.usuario.controller import app_usuario
from modules.cliente.controller import app_cliente

app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False

app.register_blueprint(app_usuario)
app.register_blueprint(app_cliente)
app.register_blueprint(app_barbearia)
app.register_blueprint(app_atividade)

if __name__ == '__main__':
    app.run(debug=True)