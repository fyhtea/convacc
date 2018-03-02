circuit GCD : @[:@2.0]
  module GCD : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_value1 : UInt<16> @[:@6.4]
    input io_value2 : UInt<16> @[:@6.4]
    input io_loadingValues : UInt<1> @[:@6.4]
    output io_outputGCD : UInt<16> @[:@6.4]
    output io_outputValid : UInt<1> @[:@6.4]
  
    reg x : UInt<16>, clock with :
      reset => (UInt<1>("h0"), x) @[GCD.scala 21:15:@8.4]
    reg y : UInt<16>, clock with :
      reset => (UInt<1>("h0"), y) @[GCD.scala 22:15:@9.4]
    node _T_9 = gt(x, y) @[GCD.scala 24:10:@10.4]
    node _T_10 = sub(x, y) @[GCD.scala 24:24:@12.6]
    node _T_11 = asUInt(_T_10) @[GCD.scala 24:24:@13.6]
    node _T_12 = tail(_T_11, 1) @[GCD.scala 24:24:@14.6]
    node _T_13 = sub(y, x) @[GCD.scala 25:25:@18.6]
    node _T_14 = asUInt(_T_13) @[GCD.scala 25:25:@19.6]
    node _T_15 = tail(_T_14, 1) @[GCD.scala 25:25:@20.6]
    node _GEN_0 = mux(_T_9, _T_12, x) @[GCD.scala 24:15:@11.4]
    node _GEN_1 = mux(_T_9, y, _T_15) @[GCD.scala 24:15:@11.4]
    node _GEN_2 = mux(io_loadingValues, io_value1, _GEN_0) @[GCD.scala 27:26:@23.4]
    node _GEN_3 = mux(io_loadingValues, io_value2, _GEN_1) @[GCD.scala 27:26:@23.4]
    node _T_17 = eq(y, UInt<1>("h0")) @[GCD.scala 33:23:@28.4]
    io_outputGCD <= x
    io_outputValid <= _T_17
    x <= _GEN_2
    y <= _GEN_3
