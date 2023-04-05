from modules.usuario.dao import UsuarioDAO as dao_usuario

class Barbearia:

    def __init__(self, nome, whatsapp, local, horarios, usuario, id= None):
        self.id = id
        self._nome = nome
        self._whatsapp = whatsapp
        self._local = local
        self._horarios = horarios
        self.usuario = usuario

    def get_usuario(self):
        return dao_usuario.get_by_id(str(self.usuario))

    def __str__(self):
        return f'{self._nome} contato: {self._whatsapp}'

    def get_data_dict(self):
        return {
            'nome': self._nome,
            'whatsapp': self._whatsapp,
            'local': self._local,
            'horarios': self._horarios,
            'usuario': self.get_usuario().get_data_dict()
        }