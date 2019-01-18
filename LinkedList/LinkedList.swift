
public class LinkedListNode<T> {
	var value: T
	var next: LinkedListNode?
	weak var previous: LinkedListNode?
	
	public init(_ value: T) {
		self.value = value
	}
}

public class LinkedList<T> {
	public typealias Node = LinkedListNode<T>
	
	private var head: Node?
	
	public var isEmpty: Bool {
		return head == nil
	}
	
	public var first: Node? {
		return head
	}
	
	public var last: Node? {
		guard var node = head else { return nil }
		
		while let next = node.next {
			node = next
		}
		return node
	}
	
	public func append(value: T) {
		let newNode = Node(value)
		if let lastNode = last {
			newNode.previous = lastNode
			lastNode.next = newNode
		} else {
			head = newNode
		}
	}
	
	public var count: Int {
		guard var node = head else { return 0 }
		var count = 1
		while let next = node.next {
			node = next
			count += 1
		}
		return count
	}
	
	public func node(atIndex index: Int) -> Node {
		if index == 0 {
			return head!
		} else {
			var node = head!.next
			for _ in 1..<index {
				node = node?.next
				if node == nil {
					break
				}
			}
			return node!
		}
	}
	
	public subscript(index: Int) -> T {
		let n = node(atIndex: index)
		return n.value
	}
	
	public func insert(_ node: Node, atIndex index: Int) {		
		if index == 0 {
			// insert at head
			node.next = head
			head?.previous = node
			head = node
		} else {
			let prev = self.node(atIndex: index - 1)
			let next = prev.next
			node.previous = prev
			prev.next = node
			
			node.next = next 
			next?.previous = node
		}
	}
	
	public func removeAll() {
		head = nil
	}
	
	public func remove(node: Node) -> T {
		let prev = node.previous
		let next = node.next
		
		if let prev = prev {
			prev.next = next 
		} else {
			head = next
		}
		next?.previous = prev
		
		node.previous = nil
		node.next = nil
		return node.value
	}
}

let list = LinkedList<String>()
list.append(value: "Hello")
list.append(value: "World")
print(list.isEmpty)
print(list.first!.value)
print(list.last!.value)
print(list.count)
list.insert(LinkedListNode("Dear"), atIndex: 1)
print(list.count)
print(list.node(atIndex: 0).value)
print(list.node(atIndex: 1).value)
print(list.node(atIndex: 2).value)
list.remove(node: list.node(atIndex: 1))
print(list.count)
print(list[0])
print(list[1])