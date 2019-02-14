class ParentClass {
	let parentProperty = 42
}

class ChildClass: ParentClass {
	let childProperty = 43
}

struct ParentStruct {
	let parentProperty = 42
}

// following won't work
//struct ChildStruct: ParentStruct {
//	let childProperty = 43
//}

enum ParentEnum {
	case parentCase
}

enum ChildEnum: ParentEnum {
	case childCase
}