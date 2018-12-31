// This file is practice only. Refer to Heap.swift

public struct Heap<T> {
	var nodes = [T]()
	let orderCriteria: (T, T) -> Bool
	
	public init(sort: @escaping (T, T) -> Bool) {
		orderCriteria = sort
	}
	
	public init(array: [T], sort: @escaping (T, T) -> Bool){
		nodes = array
		orderCriteria = sort
		configureHeap(from: array)
	}
	
	public mutating func insert(_ item: T) {
		nodes.append(item)
		shiftUp(from: nodes.count - 1)
	}
	
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
	public mutating func remove(at index: Int) -> T? {
		guard index >= 0 && index < nodes.count else { return nil }
		
		let lastIndex = nodes.count - 1
		if index != lastIndex {
			nodes.swapAt(index, lastIndex)
			shiftDown(from: index, until: lastIndex)
			shiftUp(from: index)
		}
		return nodes.removeLast()
	}
	
	public mutating func replace(index: Int, value: T) {
		guard index < nodes.count && index >= 0 else { return } 
		
		remove(at: index)
		insert(value)
	} 
	
	private mutating func configureHeap(from array: [T]) {
		nodes = array
		for i in stride(from: nodes.count/2 - 1, through: 0, by: -1) {
			shiftDown(i)
		}
	}
	
	private mutating func shiftDown(_ index: Int) {
		shiftDown(from: index, until: nodes.count)
	}
	
	private mutating func shiftUp(from index: Int) {
		guard index > 0 && index < nodes.count else { return }
		
		var childIndex = index
		var parentIndex = self.parentIndex(of: childIndex)
		let child = nodes[childIndex]
		
		while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) == true {
			nodes[childIndex] = nodes[parentIndex]
			childIndex = parentIndex
			parentIndex = self.parentIndex(of: childIndex)
		}
		nodes[childIndex] = child
	}
	
	private mutating func shiftDown(from index: Int, until endIndex: Int) {
		let leftChildIndex = self.leftChildIndex(of: index)
		let rightChildIndex = leftChildIndex + 1
		
		var first = index
		if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
			first = leftChildIndex
		}
		if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
			first = rightChildIndex
		}
		if first == index { return }
		
		nodes.swapAt(index, first)
		shiftDown(from: first, until: endIndex)
	}

	private func leftChildIndex(of index: Int) -> Int {
		return 2*index + 1
	}
	
	private func rightChildIndex(of index: Int) -> Int {
		return 2*index + 2
	}
	
	private func parentIndex(of index: Int) -> Int {
		return (index - 1)/2
	}
}

var hMax = Heap<Int>(sort: >)
hMax.insert(1)
hMax.insert(2)
hMax.insert(3)
hMax.insert(4)

print(hMax.remove() ?? "nil")
print(hMax.remove() ?? "nil")
print(hMax.remove() ?? "nil")
print(hMax.remove() ?? "nil")
print("------")

var hMin = Heap<Int>(sort: <) 
hMin.insert(4)
hMin.insert(3)
hMin.insert(2)
hMin.insert(1)



print(hMin.remove() ?? "nil")
print(hMin.remove() ?? "nil")
print(hMin.remove() ?? "nil")
print(hMin.remove() ?? "nil")



// This file is practice only. Refer to Heap.swift