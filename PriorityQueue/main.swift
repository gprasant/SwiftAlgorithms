
var q = PriorityQueue<Int>(sort: >)

q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)

print(q.dequeue() ?? "nil")
print(q.dequeue() ?? "nil")
print(q.dequeue() ?? "nil")
print(q.dequeue() ?? "nil")
print(q.dequeue() ?? "nil")
