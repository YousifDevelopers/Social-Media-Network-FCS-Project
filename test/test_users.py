import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from src.users import Users
user_manager = Users()
def test_add_user():

    values = {'username':"ali556978676", "name":"ali ahmed5", "password":"5443345345", "is_admin":0}
    result = user_manager.add_user(values)
    if(result):
        print("succ insert user")
    else:
        print("falid insert user")

def test_update_user():
    # Update user information
    update_values = {'name': "Updated User", 'password': "updated_password", 'is_admin': 1}
    result = user_manager.update_user('ali556978676', update_values)
    
    if result:
        print("Success: User updated.")
    else:
        print("Failed: User not updated.")

def test_delete_user():

    result = user_manager.delete_user('ali556978676')
    if(result):
        print("succ delete user")
    else:
        print("falid delete user")

def test_select_user():

    result = user_manager.select_user('ali556978676')
    if(result):
        print("your user info")
        print(result)
    else:
        print("falid delete user")
def test_count_user():

    result = user_manager.count_user()
    if(result):
        print("the number of users")
        print(result)
    else:
        print("falid delete user")


if __name__ == "__main__":
    test_add_user()
    test_select_user()
    test_update_user()
    test_count_user()
    test_delete_user()
