from modules.usuario.dao import UsuarioDAO

class Cliente:

    def __init__(self, nome, telefone, user_id, status=True, id=None):
        self.id = id
        self._nome = nome
        self._telefone = telefone
        self._usuario = user_id
        self._status = status

    def __str__(self):
        return f'Cliente: {self._nome}\nTelefone: {self._telefone}'

    def get_usuario(self):
        dao_usuario = UsuarioDAO()
        return dao_usuario.get_by_id(str(self._usuario))

    def get_data_dict(self):
        return {
            'id': self.id,
            'nome': self._nome,
            'telefone': self._telefone,
            'usuario': self.get_usuario().get_data_dict(),
            'status': self._status
        }
