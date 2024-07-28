import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from .mysql_database import MySQLDatabase

class UserFollow:
    def __init__(self):
        self.db = MySQLDatabase()

    def follow_user(self,from_user,to_user):
        self.db.connect()
        query = "INSERT INTO user_followers (from_user, to_user) VALUES (%s, %s)"
        values = (from_user, to_user)
        result = self.db.insert_query(query, values)
        self.db.disconnect()
        return result

    def un_follow_user(self,from_user,to_user):
        self.db.connect()
        query = "DELETE FROM user_followers where from_user = %s and to_user = %s "
        values = (from_user, to_user)
        result = self.db.delete_query(query, values)
        self.db.disconnect()
        return result

#count user followers
    def count_follower(self,to_user):
        self.db.connect()
        query = f"SELECT * FROM user_followers where to_user ='{to_user}'"
        result = self.db.select_query(query)
        self.db.disconnect()
        return len(result)

#count user following
    def count_following(self,from_user):
        self.db.connect()
        query = f"SELECT * FROM user_followers where from_user = '{from_user}'"
        result = self.db.select_query(query)
        self.db.disconnect()
        return len(result)

    def show_followers(self,to_user):
        self.db.connect()
        where = ''
        if(to_user == ''):
            return
        query = f"SELECT * FROM user_followers where to_user = '{to_user}' "
        result = self.db.select_query(query)
        self.db.disconnect()
        return result

    def show_following(self,from_user):
        self.db.connect()
        where = ''
        if(from_user == ''):
            return
        query = f"SELECT * FROM user_followers where from_user = '{from_user}' "
        result = self.db.select_query(query)
        self.db.disconnect()
        return result

    def Suggestions_base_on_Followers_Followers(self,from_user):
        self.db.connect()
        where = ''
        if(from_user == ''):
            return
        query = f"""SELECT DISTINCT uf2.to_user AS suggested_user
FROM user_followers uf1
JOIN user_followers uf2 ON uf1.to_user = uf2.from_user
WHERE uf1.from_user = '{from_user}'
  AND uf2.to_user != '{from_user}';
 """
        result = self.db.select_query(query)
        self.db.disconnect()
        return result
