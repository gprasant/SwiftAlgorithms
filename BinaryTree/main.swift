/* 
		+
	  /   \
     A     B
*/

let nodeA = BinaryTree.node(.empty, "A", .empty)
let nodeB = BinaryTree.node(.empty, "B", .empty)
let plus =  BinaryTree.node(nodeA, "+", nodeB)
plus.traverseInOrder(process: { print($0)} )

print("----")

plus.traversePreOrder(process: { print($0) })

print("----")

plus.traversePostOrder(process: { print($0) })a