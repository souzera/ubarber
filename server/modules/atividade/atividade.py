from modules.cliente.dao import ClienteDAO as dao_cliente

class Atividade:

    def __init__(self, date, barbearia, cliente, id=None):
        self.id = id
        self.data_atv = date
        self.cliente = cliente
        self.barbearia = barbearia

    def __str__(self):
        return f'{self.barbearia}\n{self.data_atv}'

    def get_cliente(self):
        return dao_cliente.get_by_id(str(self.cliente))

    def get_barbearia(self):
        return dao_cliente.get_by_id(str(self.barbearia))

    def get_data_dict(self):
        return {
            'id': self.id,
            'date': self.date,
            'descricao':self.get_barbearia.get_data_dict(),
            'cliente': self.get_cliente().get_data_dict()
        }