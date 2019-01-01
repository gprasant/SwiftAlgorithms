var beverages = TreeNode<String>("Beverages")
	var hot = TreeNode<String>("Hot")
		var tea = TreeNode("Tea")
		var coffee = TreeNode("Coffee")
	var cold = TreeNode<String>("Cold")
		var soda = TreeNode("Soda")
		var milk = TreeNode("Milk")

hot.addChild(tea); hot.addChild(coffee)
cold.addChild(soda); cold.addChild(milk)

beverages.addChild(hot)
beverages.addChild(cold)

print(beverages.search("Soda") ?? "nil")