import networkx as nx
from pyvis.network import Network

class Graph:
    def __init__(self):
        self.adjacency_list = {}
    
    def add_node(self, node):
        if node not in self.adjacency_list:
            self.adjacency_list[node] = []
    
    def add_edge(self, node1, node2):
        if node1 in self.adjacency_list and node2 in self.adjacency_list:
            self.adjacency_list[node1].append(node2)
            self.adjacency_list[node2].append(node1)
    def remove_edge(self, node1, node2):
        if node1 in self.adjacency_list and node2 in self.adjacency_list:
            if node2 in self.adjacency_list[node1]:
                self.adjacency_list[node1].remove(node2)
            if node1 in self.adjacency_list[node2]:
                self.adjacency_list[node2].remove(node1)
    
    def remove_node(self, node):
        if node in self.adjacency_list:
            for neighbour in self.adjacency_list[node]:
                self.adjacency_list[neighbour].remove(node)
            del self.adjacency_list[node]
    def get_nodes(self):
        return list(self.adjacency_list.keys())
    
    def get_neighbours(self, node):
        return self.adjacency_list.get(node, [])

    def __str__(self):
        return str(self.adjacency_list)
    def to_networkx(self):
        G = nx.Graph()
        for node in self.adjacency_list:
            G.add_node(node)
            for neighbour in self.adjacency_list[node]:
                G.add_edge(node, neighbour)
        return G

    def bfs(self, start_node):
        visited = set()
        queue = [start_node]
        result = []
        
        while queue:
            node = queue.pop(0)
            if node not in visited:
                visited.add(node)
                result.append(node)
                for neighbour, _ in self.adjacency_list[node]:
                    if neighbour not in visited:
                        queue.append(neighbour)
        
        return result
    
    def dfs(self, start_node):
        visited = set()
        stack = [start_node]
        result = []
        
        while stack:
            node = stack.pop()
            if node not in visited:
                visited.add(node)
                result.append(node)
                for neighbour, _ in self.adjacency_list[node]:
                    if neighbour not in visited:
                        stack.append(neighbour)
        
        return result
    
    def dijkstra(self, start_node, target_node):
        distances = {node: float('infinity') for node in self.adjacency_list}
        distances[start_node] = 0
        priority_queue = [(0, start_node)]
        previous_nodes = {node: None for node in self.adjacency_list}
        
        while priority_queue:
            current_distance, current_node = heapq.heappop(priority_queue)
            
            if current_distance > distances[current_node]:
                continue
            
            for neighbour, weight in self.adjacency_list[current_node]:
                distance = current_distance + weight
                
                if distance < distances[neighbour]:
                    distances[neighbour] = distance
                    previous_nodes[neighbour] = current_node
                    heapq.heappush(priority_queue, (distance, neighbour))
        
        path = []
        current_node = target_node
        
        while previous_nodes[current_node] is not None:
            path.append(current_node)
            current_node = previous_nodes[current_node]
        
        if path:
            path.append(start_node)
        
        path.reverse()
        return path