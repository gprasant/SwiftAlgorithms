let tree = BinarySearchTree(array: [7, 2, 5, 10, 9, 1])

print(tree.search(2)?.successor()?.value ?? "nil")

print(tree.isBST(minValue: Int.min, maxValue: Int.max))

// breaking the isBST
let node2 = tree.search(2)!
node2.insert(value: 100)
print(tree.isBST(minValue: Int.min, maxValue: Int.max))