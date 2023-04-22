Currently, these are the matchers that exist in mlir query:
```
"hasArgument",        hasArgument(op, index)      // Matches operation at the given argument index
"definedBy",          definedBy(op)               // Matches operation defined by op
"getDefinitions",     getDefinitions(op, hops)    // Matches definitions with hops=hops
"getAllDefinitions",  getAllDefinitions(op, hops) // Matches all definitions with hops<=hops
"usedBy",             usedBy(op)                  // Matches all operations used by op
"getUses",            getUses(op, hops)           // Matches uses with hops=hops
"getAllUses",         getAllUses(op, hops)        // Matches all uses with hops<=hops
"isConstantOp",       isConstantOp()              // Matches all contant operations
"hasOpAttr",          hasOpAttr(attrName)         // Matches all operations that has the given attrName
"hasOpName",          hasOpName(opName)           // Matches all operations with the given opName
```

To extract all the definitions of the operation `test.use_coo` upto 2 hops away (into a function), we can do:

```bash
$ mlir-query test1.mlir
mlir-query> m getAllDefinitions(hasOpName("test.use_coo"), 2).extract()
```

which will return 
```MLIR
func.func @extracted(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32) {
  %c1_i32 = arith.constant 1 : i32
  %0 = "test.one_result"(%arg0, %arg1) : (i32, i32) -> i32
  %1 = "test.boo"(%arg2, %arg3) : (i32, i32) -> i32
  %2 = "test.coo"(%1, %0, %c1_i32) : (i32, i32, i32) -> i32
  return
}
```
