//let adjacencyList = AdjacencyList<String>()
//
//let singapore = adjacencyList.createVertex(data: "Singapore")
//let tokyo = adjacencyList.createVertex(data: "Tokyo")
//let hongKong = adjacencyList.createVertex(data: "Hong Kong")
//let detroit = adjacencyList.createVertex(data: "Detroit")
//let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
//let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
//let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
//let seattle = adjacencyList.createVertex(data: "Seattle")
//
//adjacencyList.add(.undirected, from: singapore, to: hongKong, weight: 300)
//adjacencyList.add(.undirected, from: singapore, to: tokyo, weight: 500)
//adjacencyList.add(.undirected, from: hongKong, to: tokyo, weight: 250)
//adjacencyList.add(.undirected, from: tokyo, to: detroit, weight: 450)
//adjacencyList.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
//adjacencyList.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
//adjacencyList.add(.undirected, from: detroit, to: austinTexas, weight: 50)
//adjacencyList.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
//adjacencyList.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
//adjacencyList.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
//adjacencyList.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
//adjacencyList.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)
//
////print(adjacencyList.description)
//
//print(adjacencyList.weight(from: singapore, to: tokyo) ?? "nil")
//
//if let flightsFromSF = adjacencyList.edges(from: sanFrancisco) {
//	print("From San Francisco")
//	print("-------------------")
//	for edge in flightsFromSF {
//		print("\tto: \(edge.destination) weight: \(edge.weight ?? -1) ")
//	}
//}

let adjacencyList = AdjacencyList<String>()

let s = adjacencyList.createVertex(data: "S")
let a = adjacencyList.createVertex(data: "A")
let b = adjacencyList.createVertex(data: "B")
let c = adjacencyList.createVertex(data: "C")
let d = adjacencyList.createVertex(data: "D")
let f = adjacencyList.createVertex(data: "F")
let g = adjacencyList.createVertex(data: "G")
let e = adjacencyList.createVertex(data: "E")

adjacencyList.add(.undirected, from: s, to: a, weight: nil)
adjacencyList.add(.undirected, from: a, to: b, weight: nil)
adjacencyList.add(.undirected, from: a, to: d, weight: nil)
adjacencyList.add(.undirected, from: a, to: c, weight: nil)
adjacencyList.add(.undirected, from: b, to: d, weight: nil)
adjacencyList.add(.undirected, from: d, to: g, weight: nil)
adjacencyList.add(.undirected, from: d, to: f, weight: nil)
adjacencyList.add(.undirected, from: f, to: e, weight: nil)

print(adjacencyList.description)
