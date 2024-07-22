import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from .mysql_database import MySQLDatabase

class UserClub:
    def __init__(self):
        self.db = MySQLDatabase()

    def follow_club(self,username,club_code):
        self.db.connect()
        query = "INSERT INTO user_club (username, club_code) VALUES (%s, %s)"
        values = (username, club_code)
        result = self.db.insert_query(query, values)
        self.db.disconnect()
        return result

    def un_follow_club(self,username,club_code):
        self.db.connect()
        query = "DELETE FROM user_club where username = %s and club_code = %s "
        values = (username, club_code)
        result = self.db.delete_query(query, values)
        self.db.disconnect()
        return result

#count user followers
    def count_club_follower(self,club_code):
        self.db.connect()
        query = f"SELECT * FROM user_club where club_code ='{club_code}'"
        result = self.db.select_query(query)
        self.db.disconnect()
        return len(result)

#count user follower
    def count_user_club_follower(self,username):
        self.db.connect()
        query = f"SELECT * FROM user_club where username = '{username}' "
        result = self.db.select_query(query)
        self.db.disconnect()
        return len(result)

    def show_club_followers(self,club_code):
        self.db.connect()
        where = ''
        if(club_code == ''):
            return
        query = f"SELECT * FROM user_club uc left join users u on uc.username = u.username where uc.club_code = '{club_code}' "
        result = self.db.select_query(query)
        self.db.disconnect()
        return result

    def show_user_club_follower(self,username):
        self.db.connect()
        where = ''
        if(username == ''):
            return
        query = f"SELECT * FROM user_club uc left join clubs c on uc.club_code = c.club_code where uc.username = '{username}' "
        result = self.db.select_query(query)
        self.db.disconnect()
        return result
