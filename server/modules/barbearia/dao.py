from connect.conect import ConnectDatabase
from modules.barbearia.barbearia import Barbearia


class BarbeariaDAO:

    _TABLE_NAME = 'barbearia'

    _SELECT_ALL = f'SELECT * FROM {_TABLE_NAME}'
    _SELECT_BY_ID = f'SELECT * FROM {_TABLE_NAME} WHERE id= %s'


    def __init__(self):
        self.database = ConnectDatabase.get_instance()

    def get_all(self):
        barbearias = []
        cursor = self.database.cursor()
        cursor.execute(self._SELECT_ALL)
        all_barbearia = cursor.fetchall()
        collumns_name = [desc[0] for desc in cursor.description]
        for barbearia_query in all_barbearia:
            data = dict(zip(collumns_name, barbearia_query))
            barbearia = Barbearia(**data)
            barbearias.append(barbearia)
        cursor.close()
        return barbearias

    def get_by_id(self,id):
        pass