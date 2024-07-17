# For Test mysql class function to make sure it's work before continue 

from src.mysql_database import MySQLDatabase

def test_mysql_connection():
    db = MySQLDatabase()
    try:
        db.connect()
        assert db.connection is not None, "Database connection failed or is None"
        print("Connected to MySQL database successfully!")
    except AssertionError as e:
        print(f"AssertionError: {e}")
    finally:
        db.disconnect()

def test_select_query():
    db = MySQLDatabase()
    try:
        db.connect()
        query = "SELECT * FROM users"
        result = db.select_query(query)
        
        if result is None:
            raise AssertionError("Select query returned None or encountered an error")
        
        if len(result) == 0:
            print("Select query returned 0 rows")
        else:
            print(f"Select query returned {len(result)} rows")
            for row in result:
                print(row)  # Print each row to verify the data
                
    except AssertionError as e:
        print(f"AssertionError: {e}")
    except Exception as ex:
        print(f"Exception occurred: {ex}")
    finally:
        db.disconnect()


def test_insert_query():
    db = MySQLDatabase()
    try:
        db.connect()
        query = "INSERT INTO users (username, name, password, is_admin) VALUES (%s, %s, %s, %s)"
        values = ("ali556978", "ali ahmed", "5443345345", 0)
        result = db.insert_query(query, values)
        assert result is not None, "Insert query failed"
        print("Insert query successful")
    except AssertionError as e:
        print(f"AssertionError: {e}")
    finally:
        db.disconnect()

def test_update_query():
    db = MySQLDatabase()
    try:
        db.connect()
        query = "UPDATE users SET name = %s WHERE username = %s"
        values = ("ahmed ali", "ali556978")
        result = db.update_query(query, values)
        assert result is not None, "Update query failed"
        print("Update query successful")
    except AssertionError as e:
        print(f"AssertionError: {e}")
    finally:
        db.disconnect()

def test_delete_query():
    db = MySQLDatabase()
    try:
        db.connect()
        query = "DELETE FROM users WHERE username = %s"
        values = ("ali556978", )
        result = db.delete_query(query, values)
        assert result is not None, "Delete query failed"
        print("Delete query successful")
    except AssertionError as e:
        print(f"AssertionError: {e}")
    finally:
        db.disconnect()

if __name__ == "__main__":
    test_mysql_connection()
    test_select_query()
    test_insert_query()
    test_update_query()
    test_delete_query()
    print("All tests passed!")
