import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from src.network import SocialNetwork
social_network = SocialNetwork()

social_network.user_follow_network()
