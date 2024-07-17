import json
import os
import mysql.connector

class MySQLDatabase:
    def __init__(self, config_file='../data/db_config.json'):
        config_path = os.path.join(os.path.dirname(__file__), config_file)
        with open(config_path, 'r') as f:
            config = json.load(f)
            self.host = config['host']
            self.user = config['user']
            self.password = config['password']
            self.database = config['database']
        
        self.connection = None
        self.cursor = None
    
    def connect(self):
        try:
            self.connection = mysql.connector.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.database
            )
            self.cursor = self.connection.cursor()
            print("Connected to MySQL database!")
        except mysql.connector.Error as e:
            print(f"Error connecting to MySQL: {e}")
    
    def disconnect(self):
        if self.connection:
            self.connection.close()
            print("Disconnected from MySQL database.")
    
    def execute_query(self, query, values=None):
        try:
            self.cursor.execute(query, values)
            self.connection.commit()
            print("Query executed successfully.")
            return self.cursor.fetchall()
        except mysql.connector.Error as e:
            print(f"Error executing query: {e}")
            return None
    
    def select_query(self, query):
        try:
            cursor = self.connection.cursor()
            cursor.execute(query)
            result = cursor.fetchall()
            cursor.close()
            return result
        except Exception as e:
            print(f"Error executing query: {e}")
            return None
    
    def insert_query(self, query, values):
        return self.execute_query(query, values)
    
    def update_query(self, query, values):
        return self.execute_query(query, values)
    
    def delete_query(self, query, values):
        return self.execute_query(query, values)

# Example usage remains the same as previously shown
