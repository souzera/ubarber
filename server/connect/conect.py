import psycopg2

class ConnectDatabase:

    def __init__(self):
        self.connect = psycopg2.connect(
            host="localhost",
            database="ubarber-db",
            user="postgres",
            password="1969"
        )

    def get_instance(self):
        return self.connect