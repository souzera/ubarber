from connect.conect import ConnectDatabase
from modules.usuario.usuario import Usuario

class UsuarioDAO:

    _TABLE_NAME = 'usuarios'

    _INSERT_INTO = f'INSERT INTO {_TABLE_NAME}(username, senha, url_avatar, status) VALUES(%s, %s, %s, %s) RETURNING id'
    _SELECT_ALL = f'SELECT * FROM {_TABLE_NAME}'
    _SELECT_BY_ID = f'SELECT * FROM {_TABLE_NAME} WHERE id = %s'
    _DELETE_BY_ID = f'DELETE * FROM {_TABLE_NAME} WHERE id = %s'
    _DISABLE_BY_ID = f'UPDATE {_TABLE_NAME} SET status=false WHERE id = %s'
    _UPDADE_BY_ID = f'UPDATE {_TABLE_NAME} SET username = %s, senha = %s, url_avatar = %s, status = %s WHERE id=%s'

    def __init__(self):
        self.database = ConnectDatabase().get_instance()

    def salvar(self, usuario):

        if self.get_all_username().__contains__(usuario._username):
            raise Exception("Usuário já existe.")

        if usuario.id is None:
            cursor = self.database.cursor()
            cursor.execute(self._INSERT_INTO,(usuario._username, usuario._senha, usuario._avatar, usuario._status))
            id = cursor.fetchone()[0]
            self.database.commit()
            usuario.id = id
            return usuario
        else:
            raise Exception('Não foi possível salvar')

    def get_all(self):
        usuarios = []
        cursor = self.database.cursor()
        cursor.execute(self._SELECT_ALL)
        all_usuarios = cursor.fetchall()
        colluns_name = [desc[0] for desc in cursor.description]
        for usuario_query in all_usuarios:
            data = dict(zip(colluns_name, usuario_query))
            usuario = Usuario(**data)
            usuarios.append(usuario)
        cursor.close()
        return usuarios

    def get_by_id(self, id):
        cursor = self.database.cursor()
        cursor.execute(self._SELECT_BY_ID, id)
        colluns_name = [desc[0] for desc in cursor.description]
        usuario_query = cursor.fetchone()
        data = dict(zip(colluns_name, usuario_query))
        usuario = Usuario(**data)
        cursor.close()
        return usuario

    def delete_by_id(self):
        pass

    def disable_by_id(self):
        pass

    def update_by_id(self):
        pass

    def get_all_username(self):
        usernames = []
        for usuario in self.get_all():
            usernames.append(usuario._username)
        return usernames