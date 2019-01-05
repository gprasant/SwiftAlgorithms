// Depth first search


public func pathExists<T>(in graph: AdjacencyList<T>, from source: Vertex<T>, to destination: Vertex<T>) -> Bool {
	return depthFirstSearch(in: graph, from: source, to: destination).count > 0 
}

public func depthFirstSearch<T>(in graph: AdjacencyList<T>, from start: Vertex<T>, to end: Vertex<T>? = nil) -> Stack<Vertex<T>> {
	var visited = Set<Vertex<T>>()
	var stack = Stack<Vertex<T>>()
	
	visited.insert(start)
	stack.push(start)
	
	outer: while let vertex = stack.peek(), vertex != end {
		guard let neighbors = graph.edges(from: vertex), neighbors.count > 0 else {
			print("backtrack from \(vertex)")
			stack.pop()
			continue
		}
		
		for edge in neighbors {
			if !visited.contains(edge.destination) {
				visited.insert(edge.destination)
				stack.push(edge.destination)
				print(stack.description)
				continue outer
			}
		}
		
		print("backtrack from \(vertex)")
		stack.pop()
	}
	return stack
}

func depthFirstSearch_rec<T>(graph: AdjacencyList<T>, source: Vertex<T>, target: Vertex<T>? = nil) {
	//print the current node
	source.isVisited = true
	print(source.data)
		
	guard let edges = graph.edges(from: source) else { return }
	
	for edge in edges {
		let neighbor = edge.destination
		if neighbor.isVisited == false {
			depthFirstSearch_rec(graph: graph, source: neighbor)
		}
	}
}


func breadthFirstSearch<T>(in graph: AdjacencyList<T>, from source: Vertex<T>, to destination: Vertex<T>? = nil) -> [T] {
	var visited = [T]()
	var q = Queue<Vertex<T>>()
	visited.append(source.data)
	source.isVisited = true
	q.enqueue(source)
	
	while let current = q.dequeue() {
		guard let edges = graph.edges(from: current) else { continue }
		
		for e in edges {
			let neighbor = e.destination
			if neighbor.isVisited == false {
				neighbor.isVisited = true
				visited.append(neighbor.data)
				q.enqueue(neighbor)
			}
		}
	}
	
	return visited
}