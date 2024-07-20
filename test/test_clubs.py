import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from src.clubs import Clubs
club_manager = Clubs()
def test_add_club():

    values = {'club_code':"movie310", "name":"Movies", "description":"for movies"}
    result = club_manager.add_club(values)
    if(result):
        print("succ insert club")
    else:
        print("falid insert club")

def test_update_club():

    update_values = {'name': "Updated club", 'description': "for movies update"}
    result = club_manager.update_club('movie310', update_values)
    
    if result:
        print("Success: club updated.")
    else:
        print("Failed: club not updated.")

def test_delete_club():

    result = club_manager.delete_club('movie310')
    if(result):
        print("succ delete club")
    else:
        print("falid delete club")

def test_select_club():

    result = club_manager.select_club('movie310')
    if(result):
        print("your user info")
        print(result)
    else:
        print("falid delete user")
def test_count_club():

    result = club_manager.count_club()
    if(result):
        print("the number of club")
        print(result)
    else:
        print("falid delete clubs")


if __name__ == "__main__":
    test_add_club()
    test_select_club()
    test_update_club()
    test_select_club()
    test_count_club()
    test_delete_club()
