import sys
import os
import bcrypt
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from .mysql_database import MySQLDatabase

class Users:
    def __init__(self):
        self.db = MySQLDatabase()

    def add_user(self, user_info: dict):
        self.db.connect()
        user_info['password'] = self.hash_password(user_info['password'])
        query = "INSERT INTO users (username, name, password, is_admin) VALUES (%s, %s, %s, %s)"
        values = (user_info['username'], user_info['name'], user_info['password'], user_info['is_admin'])
        result = self.db.insert_query(query, values)
        self.db.disconnect()
        return result

    def update_user(self, username, user_info: dict):
        self.db.connect()
        user_info['password'] = self.hash_password(user_info['password'])
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
    
    def login(self,username,password):
        self.db.connect() 
        query = f"SELECT * FROM users where username = '{username}' "
        result = self.db.select_query(query)
        if(len(result) == 0):
            return {"login":False,"Message":"Username not found"}
        user_info = result[0]
        self.db.disconnect()
        check_password = self.verify_password(user_info['password'],password)
        if(check_password):
            return {"login":True,"Message":"","is_admin":user_info['is_admin'],"user_info":user_info}
        else:
            return {"login":False,"Message":"Password not match"}
    
    def hash_password(self,password: str) -> str:
        salt = bcrypt.gensalt()
        hashed = bcrypt.hashpw(password.encode(), salt)
        return hashed.decode()
    
    def verify_password(self,stored_password: str, provided_password: str) -> bool:
        return bcrypt.checkpw(provided_password.encode(), stored_password.encode())