/*
	- push, pop, peek
	- isEmpty, count
*/
class Stack<Element> {
	private var array = [Element]()
	
	func push(_ item: Element) {
		array.append(item)
	}
	
	func pop() -> Element? {
		return array.popLast()
	}
	
	func peek() -> Element? {
		return array.last
	}
	
	var isEmpty: Bool {
		return array.isEmpty
	}
	
	var count: Int {
		return array.count
	}
}

extension Stack: CustomStringConvertible {
	var description: String {
		let header = "--- Stack ---\n"
		let footer = "\n-------------\n"

		let contents: String = array.map { "\($0)" }.reversed().joined(separator: "\n")
		return header + contents + footer
	}
}

