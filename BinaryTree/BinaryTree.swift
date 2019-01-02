public indirect enum BinaryTree<T> {
	case empty
	case node(BinaryTree<T>, T, BinaryTree<T>)
	
	public var count: Int {
		switch self {
			case .empty:
				return 0
			case let .node(left, _, right):
				return left.count + right.count + 1
		}
	}
	
	public func traverseInOrder(process: (T) -> Void) {
		switch self {
			case let .node(left, value, right):
				left.traverseInOrder(process: process)
				process(value)
				right.traverseInOrder(process: process)
			case .empty: return
		}
	}
	
	public func traversePreOrder(process: (T) -> Void) {
		if case let .node(left, value, right) = self {
			process(value)
			left.traversePreOrder(process: process)
			right.traversePreOrder(process: process)
		}
	}
	
	public func traversePostOrder(process: (T) -> Void) {
		if case let .node(left, value, right) = self {
			left.traversePostOrder(process: process)
			right.traversePostOrder(process: process)
			process(value)
		}
	}
}

extension BinaryTree: CustomStringConvertible {
	public var description: String {
		switch self {
			case .empty: 
				return ""
			case let .node(left, value, right): 
				return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
		}
	}
}
