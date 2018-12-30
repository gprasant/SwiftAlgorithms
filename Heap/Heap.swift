/*
- array, orderCriteria
- index for parent, leftChild, rightChild
- insert, remove
- shiftUp(), shiftDown()
*/
public struct Heap<T> {
	private var nodes = [T]()
	private let orderCriteria: (T, T) -> Bool
	
	public init(sort: @escaping (T, T) -> Bool) {
		orderCriteria = sort
	}
	
	public init(array: [T], sort: @escaping (T, T) -> Bool) {
		self.orderCriteria = sort
		configureHeap(from: array)

	}
	
	private mutating func configureHeap(from array: [T]) {
		nodes = array
		for i in stride(from: (nodes.count/2 - 1), through: 0, by: -1) {
			shiftDown(i)
		}
	}
	
	public var isEmpty: Bool {
		return nodes.isEmpty
	}
	
	public var count: Int {
		return nodes.count
	}
	
	@inline(__always) 
	internal func parentIndex(ofIndex i: Int) -> Int {
		return (i - 1) / 2
	}
	
	@inline(__always)
	internal func leftChildIndex(ofIndex i: Int) -> Int {
		return 2*i + 1
	}
	
	@inline(__always)
	internal func rightChildIndex(ofIndex i: Int) -> Int {
		return 2*i + 2
	}
	
	public mutating func insert(_ item: T) {
		nodes.append(item)
		shiftUp(nodes.count - 1)
	}
	
	public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
		for i in sequence {
			insert(i)
		}
	}
	
	@discardableResult
	public func peek() -> T? {
		return nodes.first
	}
	
	@discardableResult 
	public mutating func remove() -> T? {
 		guard !nodes.isEmpty else { return nil }

		if nodes.count == 1 {
			return nodes.removeLast()
		} else {
			let result = nodes[0]
			nodes[0] = nodes.removeLast()
			shiftDown(0)
			return result		
		}
	}
	
	@discardableResult
	public mutating func remove(at index: Int) -> T?  {

		guard index < nodes.count else { return nil }
		
		let lastIndex = nodes.count - 1 
		if index != lastIndex {
			nodes.swapAt(index, lastIndex)
			shiftDown(from: index, until: lastIndex)
			shiftUp(index)
		}

		return nodes.removeLast()
	}
	
	public mutating func replace(index: Int, value: T) {
		guard index < nodes.count else { return }

		self.remove(at: index)
		self.insert(value)
	}
 		
	internal mutating func shiftDown(_ index: Int) {
		shiftDown(from: index, until: nodes.count)
	}
	
	internal mutating func shiftDown(from index: Int, until endIndex: Int) {
		var first = index 
		let leftIndex = self.leftChildIndex(ofIndex: index)
		let rightIndex = leftIndex + 1
		if leftIndex < endIndex && orderCriteria(nodes[leftIndex], nodes[first]) == true {
			// orer is (leftChild, index) instead of (index, leftChild)
			first = leftIndex // leftChild comes first. 
		}
		if rightIndex < endIndex && orderCriteria(nodes[rightIndex], nodes[first]) == true {
			// order is (rightChild, index) instead of (index, rightChild)
			first = rightIndex
		}
		if first == index { return }
		nodes.swapAt(first, index)
		shiftDown(from: first, until: endIndex)
	}
	
	internal mutating func shiftUp(_ index: Int) {

		var childIndex = index
		var parentIndex = self.parentIndex(ofIndex: childIndex)
		let child = nodes[childIndex]
		
		while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) == true {
			// need to swap
			nodes[childIndex] = nodes[parentIndex]
			// set up for the next level
			childIndex = parentIndex
			parentIndex = self.parentIndex(ofIndex: childIndex)
		}
		// by now, the parents that do not satisfy the heap property have been bubbled down.
		// now, need to set top most parents index (childIndex, because of iterations above) to the value we wanted to bubble up in the first place.
		nodes[childIndex] = child	
	}
}

extension Heap where T: Equatable {
	// indexOf(item), remove(item)
	public func index(of node: T) -> Int? {
		return nodes.firstIndex { $0 == node } 
	}
	
	@discardableResult
	public mutating func remove(_ node: T) -> T? {
		if let index = self.index(of: node) {
			return remove(at: index)
		}
		return nil
	}
} 