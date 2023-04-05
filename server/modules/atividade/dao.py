from connect.conect import ConnectDatabase
from modules.atividade.atividade import Atividade


class AtividadeDAO:

    _TABLE_NAME = 'atividades'

    _INSERT_INTO = f'INSERT INTO {_TABLE_NAME}(cliente_id, barbearia_id, data_atv) VALUES(%s, %s, %s) RETURNING id'
    _SELECT_ALL = f'SELECT * FROM {_TABLE_NAME}'
    _SELECT_BY_ID = f'SELECT * FROM {_TABLE_NAME} WHERE id = %s'
    _SELECT_BY_CLIENT = f'SELECT * FROM {_TABLE_NAME} WHERE cliente_id = %s'
    _SELECT_BY_BARBER = f'SELECT * FROM {_TABLE_NAME} WHERE barbearia_id = %s'
    _DELETE_BY_ID = f'DELETE * FROM {_TABLE_NAME} WHERE id = %s'
    #_DISABLE_BY_ID = f'UPDATE {_TABLE_NAME} SET status=false WHERE id = %s'
    _UPDADE_BY_ID = f'UPDATE {_TABLE_NAME} SET cliente_id = %s, barbearia_id = %s, data_atv = %s WHERE id=%s'

    def __init__(self):
        self.database = ConnectDatabase().get_instance()

    def get_all(self):
        atividades = []
        cursor = self.database.cursor()
        cursor.execute(self._SELECT_ALL)
        all_atividade = cursor.fetchall()
        colluns_name = [desc[0] for desc in cursor.description]
        for atividade_query in all_atividade:
            data = dict(zip(colluns_name, atividade_query))
            atividade = Atividade(**data)
            atividades.append(atividade)
        cursor.close()
        return atividades

    def get_by_id(self, id):
        cursor = self.database.cursor()
        cursor.execute(self._SELECT_BY_ID, id)
        colluns_name = [desc[0] for desc in cursor.description]
        atividade_query = cursor.fetchone()
        data = dict(zip(colluns_name, atividade_query))
        atividade = Atividade(**data)
        cursor.close()
        return atividade

    def get_by_client(self, cliente_id):
        atividades = []
        cursor = self.database.cursor()
        cursor.execute(self._SELECT_BY_CLIENT, cliente_id)
        all_atividade = cursor.fetchall()
        colluns_name = [desc[0] for desc in cursor.description]
        for atividade_query in all_atividade:
            data = dict(zip(colluns_name, atividade_query))
            atividade = Atividade(**data)
            atividades.append(atividade)
        cursor.close()
        return atividades

    def get_by_barber(self, barber_id):
        atividades = []
        cursor = self.database.cursor()
        cursor.execute(self._SELECT_BY_BARBER, barber_id)
        all_atividade = cursor.fetchall()
        colluns_name = [desc[0] for desc in cursor.description]
        for atividade_query in all_atividade:
            data = dict(zip(colluns_name, atividade_query))
            atividade = Atividade(**data)
            atividades.append(atividade)
        cursor.close()
        return atividades

    def delete_by_id(self):
        pass

    def disable_by_id(self):
        pass

    def update_by_id(self):
        pass