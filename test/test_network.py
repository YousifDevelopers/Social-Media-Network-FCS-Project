import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from src.network import SocialNetwork
follow_user_network = SocialNetwork()
follow_user_network.user_follow_network()

clus_user_network = SocialNetwork()
clus_user_network.user_club_network()