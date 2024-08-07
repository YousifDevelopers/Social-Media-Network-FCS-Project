import sys
import os
import networkx as nx
from pyvis.network import Network

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from .graph import Graph
from .user_follow import UserFollow
from .users import Users
from .user_club import UserClub
from .clubs import Clubs

class SocialNetwork(Graph):
    def __init__(self):
        super().__init__()
        self.users = Users()
        self.user_follow = UserFollow()
        self.clubs = Clubs()
        self.user_club = UserClub()
    
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
        
    def user_club_network(self):
        clubs = self.clubs.select_club()
        users = self.users.select_user()
        
        for user in users:
            self.add_node(user['username'])

        for club in clubs:
            self.add_node(club['club_code'])
        
        for club in clubs:
            club_followeres = self.user_club.show_club_followers(club['club_code'])
            for follow in club_followeres:
                self.add_edge(club['club_code'], follow['username'])
            
        network_gr = self.to_networkx()
        net = Network(notebook=True)
        net.from_nx(network_gr)
        
        folder_path = 'network_graph' 
        file_name = 'club_followers_network.html'
        full_path = os.path.join(folder_path, file_name)
        
        # Create the directory if it doesn't exist
        os.makedirs(folder_path, exist_ok=True)
        
        net.show(full_path)
    def bfs(self, start_node):
        return super().bfs(start_node)

    def dfs(self, start_node):
        return super().dfs(start_node)

    def dijkstra(self, start_node, target_node):
        return super().dijkstra(start_node, target_node)

    def connected_components(self):
        return super().connected_components()

    def display_bfs(self, start_node):
        bfs_result = self.bfs(start_node)
        print(f"BFS from {start_node}: {bfs_result}")

    def display_dfs(self, start_node):
        dfs_result = self.dfs(start_node)
        print(f"DFS from {start_node}: {dfs_result}")

    def display_dijkstra(self, start_node, target_node):
        path = self.dijkstra(start_node, target_node)
        print(f"Shortest path from {start_node} to {target_node}: {path}")

    def display_connected_components(self):
        components = self.connected_components()
        print(f"Connected components: {components}")
