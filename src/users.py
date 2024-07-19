import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from .mysql_database import MySQLDatabase

class Users:
    def __init__(self):
        self.db = MySQLDatabase()

    def add_user(self, user_info: dict):
        self.db.connect()
        query = "INSERT INTO users (username, name, password, is_admin) VALUES (%s, %s, %s, %s)"
        values = (user_info['username'], user_info['name'], user_info['password'], user_info['is_admin'])
        result = self.db.insert_query(query, values)
        self.db.disconnect()
        return result

    def update_user(self, username, user_info: dict):
        self.db.connect()
        query = "UPDATE users SET name = %s, password = %s, is_admin = %s WHERE username = %s"
        values = (user_info['name'], user_info['password'], user_info['is_admin'], username)
        result = self.db.update_query(query, values)
        self.db.disconnect()
        return result

    def delete_user(self, username):
        self.db.connect()
        query = "DELETE FROM users where username = %s"
        values = (username,)
        result = self.db.delete_query(query, values)
        self.db.disconnect()
        return result

    def select_user(self,username = ''):
        self.db.connect()
        where = ''
        if(username != ''):
            where = f'where username = "{username}"'
        
        query = f"SELECT * FROM users {where} "
        result = self.db.select_query(query)
        self.db.disconnect()
        return result

    def count_user(self):
        self.db.connect()
        query = "SELECT * FROM users  "
        result = self.db.select_query(query)
        self.db.disconnect()
        return len(result)