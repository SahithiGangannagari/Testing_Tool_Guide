import mysql.connector

class Database:
    def __init__(self):
        self.db = mysql.connector.connect(
            host = "localhost",
            user = "username",
            passwd = "password",
            database = "testing"
        )
        self.db.autocommit = True
        self.cursor = ""
    def getcursor(self, dictmode=True):
        if dictmode:
            self.cursor = self.db.cursor(buffered=True, dictionary=True)
        else:
            self.cursor = self.db.cursor(buffered=True)
        return self.cursor
    def commit(self):
        self.db.commit()
    def closeconn(self):
        self.cursor.close()
        self.db.close()
