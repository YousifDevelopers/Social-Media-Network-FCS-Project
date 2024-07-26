import sys
import os
import networkx as nx
from pyvis.network import Network

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from .graph import Graph
from .user_follow import UserFollow
from .users import Users

class SocialNetwork(Graph):
    def __init__(self):
        super().__init__()
        self.users = Users()
        self.user_follow = UserFollow()
    
    def user_follow_network(self):
        users = self.users.select_user()
        
        for user in users:
            self.add_node(user['username'])
        
        for user in users:
            user_following = self.user_follow.show_following(user['username'])
            for follow in user_following:
                self.add_edge(user['username'], follow['to_user'])
            
        network_gr = self.to_networkx()
        net = Network(notebook=True)
        net.from_nx(network_gr)
        
        folder_path = 'network_graph'  # Use the correct folder path
        file_name = 'user_follow_network.html'
        full_path = os.path.join(folder_path, file_name)
        
        # Create the directory if it doesn't exist
        os.makedirs(folder_path, exist_ok=True)
        
        net.show(full_path)
