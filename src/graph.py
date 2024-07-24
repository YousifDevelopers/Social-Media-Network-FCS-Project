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
