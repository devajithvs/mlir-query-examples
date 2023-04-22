module {
  func.func @foo(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    "test.noop"() : () -> ()
    "test.no_result"(%arg0) : (i32) -> ()
    %0 = "test.unused_result"(%arg0, %arg1) : (i32, i32) -> i32
    %1 = "test.one_result"(%arg0, %arg1) : (i32, i32) -> i32
    %2:2 = "test.many_results"(%1) : (i32) -> (i32, i32)
    %3 = "test.foo"(%c1_i32, %2#1) : (i32, i32) -> i32
    %4 = "test.boo"(%2#0, %3) : (i32, i32) -> i32
    %5 = "test.coo"(%4, %1, %c1_i32) : (i32, i32, i32) -> i32
    "test.use_coo"(%5) : (i32) -> ()
    return %5 : i32
  }
}
