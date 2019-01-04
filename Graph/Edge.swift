
public enum EdgeType {
	case directed, undirected
}

public struct Edge<T: Hashable> {
	let source: Vertex<T>
	let destination: Vertex<T>
	let weight: Double?
}

extension Edge: Hashable {
	public var hashValue: Int {
		return "\(source)\(destination)\(String(describing: weight))".hashValue
	}
	
	static public func == (lhs: Edge, rhs: Edge) -> Bool {
		guard lhs.source == rhs.source else { return false }
		guard lhs.destination == rhs.destination else { return false }
		guard lhs.weight == rhs.weight else { return false }
		
		return true
	}
}

