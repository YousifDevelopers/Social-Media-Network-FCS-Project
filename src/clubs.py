import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from .mysql_database import MySQLDatabase

class Clubs:
    def __init__(self):
        self.db = MySQLDatabase()

    def add_club(self, club_info: dict):
        self.db.connect()
        query = "INSERT INTO clubs (club_code,name, description) VALUES (%s,%s, %s)"
        values = (club_info['club_code'],club_info['name'], club_info['description'])
        result = self.db.insert_query(query, values)
        self.db.disconnect()
        return result

    def update_club(self, club_code, club_info: dict):
        self.db.connect()
        query = "UPDATE clubs SET name = %s, description = %s WHERE club_code = %s"
        values = (club_info['name'], club_info['description'], club_code)
        result = self.db.update_query(query, values)
        self.db.disconnect()
        return result

    def delete_club(self, club_code):
        self.db.connect()
        query = "DELETE FROM clubs where club_code = %s"
        values = (club_code,)
        result = self.db.delete_query(query, values)
        self.db.disconnect()
        return result

    def select_club(self,club_code = ''):
        self.db.connect()
        where = ''
        if(club_code  != ''):
            where = f'where club_code  = "{club_code }"'
        
        query = f"SELECT * FROM clubs {where} "
        result = self.db.select_query(query)
        self.db.disconnect()
        return result

    def count_club(self):
        self.db.connect()
        query = "SELECT * FROM clubs  "
        result = self.db.select_query(query)
        self.db.disconnect()
        return len(result)