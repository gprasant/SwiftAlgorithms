
/* 
- enqueue(), dequeue(), peek()
- changePriority(index: value:)
*/
public struct PriorityQueue<T> {
	fileprivate var heap: Heap<T>
	
	public init(sort: @escaping (T, T) -> Bool) {
		heap = Heap(sort: sort)
	}
	
	public mutating func enqueue(_ item: T) {
		heap.insert(item)
	} 
	
	public mutating func dequeue() -> T? {
		return heap.remove()
	}
	
	public func peek() -> T? {
		return heap.peek()
	}
	
	public mutating func changePriority(at index: Int, value: T) {
		heap.replace(index: index, value: value)
	}
	
	public var isEmpty: Bool {
		return heap.isEmpty
	}
	
	public var count: Int {
		return heap.count
	}
}