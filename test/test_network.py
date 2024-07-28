import sys
import os
import heapq
from collections import deque

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from src.network import SocialNetwork

def test_social_network():
    network = SocialNetwork()
    
    network.user_follow_network()  # or network.user_club_network()
    
    start_node = 'user1'  # Replace with an actual username in your data
    bfs_result = network.bfs(start_node)
    print(f"BFS from {start_node}: {bfs_result}")
    
    dfs_result = network.dfs(start_node)
    print(f"DFS from {start_node}: {dfs_result}")
    
    target_node = 'user5'  # Replace with an actual username in your data
    path = network.dijkstra(start_node, target_node)
    print(f"Shortest path from {start_node} to {target_node}: {path}")
    
    components = network.connected_components()
    print(f"Connected components: {components}")

if __name__ == "__main__":
    test_social_network()
