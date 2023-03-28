from connect.conect import ConectDatabase
from usuario import Usuario

class UsuarioDAO:

    _TABLE_NAME = 'usuarios'

    _INSERT_INTO = f'INSERT INTO {_TABLE_NAME}(username, senha, url_avatar, status) VALUES(%s, %s, %s) RETURNING id'
    _SELECT_ALL = f'SELECT * FROM {_TABLE_NAME}'
    _SELECT_BY_ID = f'SELECT * FROM {_TABLE_NAME} WHERE id = %s'
    _DELETE_BY_ID = f'DELETE * FROM {_TABLE_NAME} WHERE id = %s'
    _DISABLE_BY_ID = f'UPDATE {_TABLE_NAME} SET status=false WHERE id = %s'
    _UPDADE_BY_ID = f'UPDATE {_TABLE_NAME} SET username = %s, senha = %s, url_avatar = %s, status = %s WHERE id=%s'

    def __init__(self):
        self.database = ConectDatabase().get_instance()

    def salvar(self):
        pass

    def get_all(self):
        pass

    def get_by_id(self):
        pass

    def delete_by_id(self):
        pass

    def disable_by_id(self):
        pass

    def update_by_id(self):
        pass
