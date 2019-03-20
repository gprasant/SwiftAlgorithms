
public class LRUCache<KeyType: Hashable> {
	private let maxSize: Int
	private var cache = [KeyType: Any]()
	private var priority = LinkedList<KeyType>()
	private var key2node = [KeyType: LinkedListNode<KeyType>]()
	
	public init(_ maxSize: Int) {
		self.maxSize = maxSize
	}
	
	public func get(_ key: KeyType) -> Any? {
		guard let val = cache[key] else {
			return nil
		}
		remove(key)
		insert(key, val)
		return val
	}
	
	public func set(_ key: KeyType, _ val: Any) {
		if cache[key] != nil {
			remove(key)
		} else if priority.count >= maxSize, let keyToRemove = priority.last?.value {
			remove(keyToRemove)
		}
		
		insert(key, val)
	}
	
	private func insert(_ key: KeyType, _ val: Any) {
		// set value in cache
		cache[key] = val
		// insert to priority
		priority.insert(LinkedListNode(key), atIndex: 0)
		// save in key2node
		guard let first = priority.first else {
			return
		}
		key2node[key] = first
	}
	
	private func remove(_ key: KeyType) {
		// remove from cache
		cache.removeValue(forKey: key)
		guard let node = key2node[key] else {
			return
		}
		// remove from priority queue
		priority.remove(node: node)
		// remove from key2node
		key2node.removeValue(forKey: key)
	}
}


