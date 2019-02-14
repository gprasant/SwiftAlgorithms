

class UITableView: UIScrollView {
	
	let cellQueues = [String: Queue<UITableViewCell>]() 
	
	func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
		guard let queue = cellQueues[identifier] else {
			fatalError("No Queue for identifier: \(identifier)")
		}
		
		if let cell = queue.dequeue() {
			return cell
		}
		return UITableViewCell(style: .default, reuseIdentifier: identifier)
	}
}

class Queue<Element> {
	private var array = [Element]()
	
	public func enqueue(_ item: Element) {
		array.append(item)
	}
	
	public func dequeue() -> Element? {
		if array.isEmpty {
			return nil
		} else {
			return array.removeFirst()
		}
	}
}

