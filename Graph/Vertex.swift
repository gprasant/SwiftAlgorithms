import Foundation 

public class Vertex<T: Hashable> {
	let data: T
	var isVisited: Bool
	
	public convenience init(data: T) {
		self.init(data: data, isVisited: false)
	}
	
	public init(data: T, isVisited: Bool) {
		self.data = data
		self.isVisited = isVisited
	}
}

extension Vertex: Hashable {
	public var hashValue: Int {
		return "\(data)".hashValue
	}
	
	static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
		return lhs.data == rhs.data
	}
}

extension Vertex: CustomStringConvertible {
	public var description: String {
		return "\(data)"
	}
}