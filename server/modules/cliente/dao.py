from connect.conect import ConnectDatabase
from modules.cliente.cliente import Cliente


class ClienteDAO:

    _TABLE_NAME = 'clientes'

    _INSERT_INTO = f'INSERT INTO {_TABLE_NAME}(nome, telefone, user_id, status) VALUES(%s,%s,%s,%s)'
    _SELECT_ALL = f'SELECT * FROM {_TABLE_NAME}'
    _SELECT_BY_ID = f'SELECT * FROM {_TABLE_NAME} WHERE id = %s'
    _DELETE_BY_ID = f'DELETE * FROM {_TABLE_NAME} WHERE id = %s'
    _DISABLE_BY_ID = f'UPDATE {_TABLE_NAME} SET status=false WHERE id = %s'
    _UPDATE_BY_ID = f'UPDATE {_TABLE_NAME} SET nome= %s, telefone= %s, user_id= %s, status= %s WHERE id = %s'


    #TODO: insert, disable, delete, update

    def __init__(self):
        self.database = ConnectDatabase().get_instance()

    def get_all(self):
        clientes = []
        cursor = self.database.cursor()
        cursor.execute(self._SELECT_ALL)
        all_clientes = cursor.fetchall()
        collumns_name = [desc[0] for desc in cursor.description]
        for cliente_query in all_clientes:
            data = dict(zip(collumns_name, cliente_query))
            cliente = Cliente(**data)
            clientes.append(cliente)
        cursor.close()
        return clientes

    def get_by_id(self, id):
        cursor = self.database.cursor()
        cursor.execute(self._SELECT_BY_ID, id)
        collumns_name = [desc[0] for desc in cursor.description]
        cliente_query = cursor.fetchone()
        data = dict(zip(collumns_name, cliente_query))
        cliente = Cliente(**data)
        cursor.close()
        return cliente

