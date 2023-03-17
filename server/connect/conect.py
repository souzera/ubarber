import psycopg2

class ConectDatabase:

    def __init__(self):
        self._connect = psycopg2.connect(
            host="localhost",
            database="ubarber_db",
            user="postgres",
            password="1969"
        )

    def get_instance(self):
        return self._connect