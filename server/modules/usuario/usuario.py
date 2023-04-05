class Usuario:

    def __init__(self, username, senha, url_avatar = 'src/icons/avatar_default.png', status=True, id = None):
        self.id = id
        self._username = username
        self._senha = senha
        self._avatar = url_avatar
        self._status = status

    def __str__(self):
        return f'usuario: {self._username}\nstatus: {self._status}'

    def get_data_dict(self):
        return {
            'id': self.id,
            'username': self._username,
            'senha': self._senha,
            'url_avatar': self._avatar,
            'status': self._status
        }

    #TODO: criptografia de senha
