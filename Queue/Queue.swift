/*
enqueue, dequeue,
isEmpty, count 
front
*/
public struct Queue<T> {
	private var array = [T?]()
	private var head = 0
	
	public mutating func enqueue(_ item: T) {
		array.append(item)
	}
	
	public mutating func dequeue() -> T? {
		// return item at head
		// set item at head to nil
		// incr head 
		// trim array if needed
		guard head < array.count, let element = array[head] else { return nil }

		array[head] = nil
		head += 1
		
		let percent = Double(head) / Double(count)
		if count > 100 && percent > 0.25 {
			array.removeFirst(head)
			head = 0
		}
		return element
	}
	
	public var isEmpty: Bool {
		return count == 0
	}
	
	public var count: Int {
		return array.count - head
	}
	
	public var front: T?  {
		if isEmpty {
			return nil
		} else {
			return array[head]
		}
	}
}

extension Queue: CustomStringConvertible {
	public var description: String {
		let header = "--- Queue ---\n"
		let footer = "\n-------------\n"
		let contents = array[head ..< (head + count)].map { String(describing: $0) }.joined(separator: "\n")
		return header + contents + footer
	}
}

extension Queue: Sequence {
	public func makeIterator() -> AnyIterator<T> {
		var copy = self
		return AnyIterator {
			 return copy.dequeue()
		}
	}
}