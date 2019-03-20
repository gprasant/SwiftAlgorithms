public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init(_ val: Int) {
		self.val = val
		self.next = nil
	}
}

class Solution {
	func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
		let result = ListNode(-1)
		var tail: ListNode? = result
		var priority = PriorityQueue<ListNode>(sort: { $0.val < $1.val })
		// Iter through lists: l
		// add l to priorityQ
		for node in lists {
			if let node = node {
				priority.enqueue(node)
			} 
		}
		
		// while n in priorityQ.dequeue()
		// result.next = ListNode(n)
		// add n.next to priorityQ if not nil 
		
		while let smallest = priority.dequeue() {
			var node: ListNode? = smallest
			tail?.next = ListNode(smallest.val)
			tail = tail?.next
			node = node?.next
			
			if let node = node {
				priority.enqueue(node)
			}
		}
		
		// return result		
		return result.next
	}
}

