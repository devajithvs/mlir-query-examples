module {
  func.func @foo(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    "test.noop"() : () -> ()
    %0 = "test.one_result"(%arg0, %arg1) : (i32, i32) -> i32
    %1:2 = "test.many_results"(%0) : (i32) -> (i32, i32)
    %2 = "test.unused_result"(%1#0, %1#1) : (i32, i32) -> i32
    %3 = "test.foo"(%c1_i32, %1#1) : (i32, i32) -> i32
    %4 = "test.boo"(%1#0, %3) : (i32, i32) -> i32
    %5 = "test.coo"(%4, %0, %c1_i32) : (i32, i32, i32) -> i32
    %6 = "test.use_coo"(%5) : (i32) -> i32
    return %6 : i32
  }
}