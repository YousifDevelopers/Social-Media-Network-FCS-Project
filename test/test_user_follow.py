import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from src.user_follow import UserFollow
from src.users import Users
follow_manager = UserFollow()
user_manager = Users()

def test_follow_user():

    values = {'username':"from_user1", "name":"ali ahmed5", "password":"5443345345", "is_admin":0}
    user_manager.add_user(values)
    values = {'username':"to_user2", "name":"ali ahmed7", "password":"5443345345", "is_admin":0}
    user_manager.add_user(values)
    result = follow_manager.follow_user('from_user1','to_user2')
    result = follow_manager.follow_user('to_user2','from_user1')
    
    if(result):
        print("succ follow user")
    else:
        print("falid follow user")

def test_un_follow_user():
    result = follow_manager.un_follow_user('to_user2','from_user1')    
    result = follow_manager.un_follow_user('from_user1','to_user2')    
    if result:
        print("Success unfollow User .")
    else:
        print("Failed unfollow User ")

def test_count_follower():

    result = follow_manager.count_follower('to_user2')    
    if(result):
        print(f"number of your followers {result}")
    else:
        print("you don't have")
        
def test_count_following():

    result = follow_manager.count_following('to_user2')    
    if(result):
        print(f"number of your followeing {result}")
    else:
        print("you don't have")

def test_show_followers():

    result = follow_manager.show_followers('to_user2')    
    if(result):
        print("Your followers")
        print(result)
    else:
        print("you don't have")
def test_show_following():

    result = follow_manager.show_following('to_user2')    
    if(result):
        print("You follow")
        print(result)
    else:
        print("you don't have")

if __name__ == "__main__":
    test_follow_user()
    test_count_following()
    test_count_follower()
    test_show_following()
    test_show_followers()
    test_un_follow_user()