import Foundation
/*
	- push, pop, peek
	- isEmpty, count
*/
struct StackStruct<Element> {
	fileprivate var array = [Element]()
	
	mutating func push(_ item: Element) {
		array.append(item)
	}
	
	mutating func pop() -> Element? {
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

extension StackStruct: CustomStringConvertible {
	var description: String {
		let header = "--- Stack ---\n"
		let footer = "\n-------------\n"

		let contents: String = array.map { "\($0)" }.reversed().joined(separator: "\n")
		return header + contents + footer
	}
}

// Enable for-in loops on Stacks
extension StackStruct : Sequence {
	func makeIterator() -> AnyIterator<Element> {
		var curr = self
		return AnyIterator {
 			return curr.pop()
		}
	}
}


//------------- Stack Class ---------------//

class StackClass<Element> : NSCopying {
	fileprivate var array = [Element]()
	
	fileprivate init(array: [Element]) {
		self.array = array
	}
	
	init() {}
	
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
	
	func copy(with zone: NSZone? = nil) -> Any {
		let copy = StackClass(array: self.array)
		return copy
	}
}

extension StackClass: CustomStringConvertible {
	var description: String {
		let header = "--- Stack ---\n"
		let footer = "\n-------------\n"

		let contents: String = array.map { "\($0)" }.reversed().joined(separator: "\n")
		return header + contents + footer
	}
}

// Enable for-in loops on Stacks
extension StackClass: Sequence {
	func makeIterator() -> AnyIterator<Element> {
		let curr = self.copy() as! StackClass<Element>
		return AnyIterator {
 			return curr.pop()
		}
	}
}