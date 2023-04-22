`build/bin/mlir-query ../mlir-query-examples/basic-queries.mlir`

## Basic Queries
m hasOpName("hello.japanese")
m hasOpAttr("hola")
m isConstantOp()

## Multiple Queries
m anyOf(hasOpName("hello.english"), hasOpAttr("konnichiwa"))
m anyOf(hasOpName("hello.english"), hasOpAttr("konnichiwa"), hasOpAttr("bonjour"))


`build/bin/mlir-query ../mlir-query-examples/nested-queries.mlir`
## Nested Queries - 1
m hasArgument(isConstantOp(), 2)
m hasArgument(hasArgument(isConstantOp(), 2), 0)

## Nested Queries - 2
m uses(hasOpName("test.coo"))
m definedBy(hasOpName("test.coo"))

m getDefinitions(hasOpName("test.coo"), 2)
m getAllDefinitions(hasOpName("test.coo"), 2)

m getAllDefinitions(hasOpName("test.use_coo"), 2)

m anyOf(hasOpName("test.use_coo"), getAllDefinitions(hasOpName("test.use_coo"), 2)).extract()

m getAllDefinitions(uses(hasOpName("test.use_coo")), 3).extract()
