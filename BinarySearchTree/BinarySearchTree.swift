
public class BinarySearchTree<T: Comparable> {
	public private(set) var value: T
	public private(set) weak var parent: BinarySearchTree<T>?
	public private(set) var left: BinarySearchTree<T>?
	public private(set) var right: BinarySearchTree<T>?
	
	public init(value: T) {
		self.value = value
	}
	
	public convenience init(array: [T]) {
		precondition(array.count > 0)
		self.init(value: array.first!)
		for i in array.dropFirst() {
			insert(value: i)
		}	
	}
	
	// isRoot, isLeaf, isLeftChild, isRightChild
	
	public var isRoot: Bool {
		return parent == nil
	}
	
	public var isLeaf: Bool {
		return left == nil && right == nil
	}
	
	public var isLeftChild: Bool {
		return parent?.left === self
	}
	
	public var isRightChild: Bool {
		return parent?.right === self
	}

	// hasLeftChild, hasRightChild, hasAnyChild, hasBothChildren, count
	public var hasLeftChild: Bool {
		return left != nil
	}
	
	public var hasRightChild: Bool {
		return right != nil
	}
	
	public var hasAnyChild: Bool {
		return hasLeftChild || hasRightChild
	}
	
	public var hasBothChildren: Bool {
		return hasLeftChild && hasRightChild
	}
	
	public var count: Int {
		let leftCount = left?.count ?? 0
		let rightCount = right?.count ?? 0
		return leftCount + rightCount + 1
	}
	
	// insert
	public func insert(value: T) {
		if value < self.value {
			// insert into left subtree
			if let left = left {
				left.insert(value: value)
			} else {
				left = BinarySearchTree(value: value)
				left?.parent = self
			}
		} else {
			// insert into right subtree
			if let right = right {
				right.insert(value: value)
			} else {
				right = BinarySearchTree(value: value)
				right?.parent = self
			}
		}
	}
	
	public func search(_ value: T) -> BinarySearchTree? {
		if value == self.value {
			return self
		} else if value < self.value && hasLeftChild {
			return left?.search(value)
		} else if value > self.value && hasRightChild {
			return right?.search(value)
		}
		return nil
	}
	
	// iterative search
	public func searchIterative(_ value: T) -> BinarySearchTree? {
		var node: BinarySearchTree? = self
		
		while let n = node {
			if value < n.value {
				node = n.left
			} else if value > n.value {
				node = n.right
			} else {
				return node
			}
		}
		return nil
	}
}

extension BinarySearchTree: CustomStringConvertible {
	public var description: String {
		var s = ""
		if let left = left {
			s += "( \(left.description) ) <- "
		}
		
		s += "\(self.value)" 
		
		if let right = right {
			s += " -> ( \(right.description) )"
		}
		return s
	}
}


let tree = BinarySearchTree(array: [7, 2, 5, 10, 9, 1])

print(tree.searchIterative(7) ?? "nil")