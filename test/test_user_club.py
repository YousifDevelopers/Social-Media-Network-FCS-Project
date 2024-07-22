import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from src.user_club import UserClub
from src.clubs import Clubs
from src.users import Users
club_manager = Clubs()
user_manager = Users()
user_club_manager = UserClub()

def test_follow_club():

    values = {'username':"user1", "name":"ali ahmed5", "password":"5443345345", "is_admin":0}
    user_manager.add_user(values)
    values = {'username':"user2", "name":"ali ahmed7", "password":"5443345345", "is_admin":0}
    user_manager.add_user(values)
    
    values = {'club_code':"movie310", "name":"Movies", "description":"for movies"}
    club_manager.add_club(values)
    values = {'club_code':"FCB234", "name":"FCB", "description":"FCB club"}
    club_manager.add_club(values)

    result = user_club_manager.follow_club('user1','movie310')
    result = user_club_manager.follow_club('user2','FCB234')
    result = user_club_manager.follow_club('user2','movie310')
    result = user_club_manager.follow_club('user1','FCB234')
    
    if(result):
        print("succ follow user club ")
    else:
        print("falid follow user club")

def test_un_follow_club():
    result = user_club_manager.un_follow_club('user1','movie310')    
    result = user_club_manager.un_follow_club('user2','FCB234')    
    result = user_club_manager.un_follow_club('user2','movie310')    
    result = user_club_manager.un_follow_club('user1','FCB234')    
    if result:
        print("Success unfollow User club .")
    else:
        print("Failed unfollow User club")

def test_count_club_follower():

    result = user_club_manager.count_club_follower('movie310')    
    if(result):
        print(f"number of club followers {result}")
    else:
        print("you don't have")
        
def test_count_user_club_follower():

    result = user_club_manager.count_user_club_follower('user2')    
    if(result):
        print(f"number of your club followeing {result}")
    else:
        print("you don't have")

def test_show_club_followers():

    result = user_club_manager.show_club_followers('movie310')    
    if(result):
        print("club  followers")
        print(result)
    else:
        print("you don't have")
def test_show_user_club_follower():

    result = user_club_manager.show_user_club_follower('user2')    
    if(result):
        print("You follow")
        print(result)
    else:
        print("you don't have")

if __name__ == "__main__":
    test_show_user_club_follower()

test_follow_club()
test_count_club_follower()
test_count_user_club_follower()
test_show_club_followers()
test_show_user_club_follower()
test_un_follow_club()





