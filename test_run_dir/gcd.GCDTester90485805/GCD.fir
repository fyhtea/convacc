;buildInfoPackage: chisel3, version: 3.0.2, scalaVersion: 2.11.11, sbtVersion: 0.13.16, builtAtString: 2018-02-05 23:25:31.873, builtAtMillis: 1517873131873
circuit GCD : 
  module GCD : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip value1 : UInt<16>, flip value2 : UInt<16>, flip loadingValues : UInt<1>, outputGCD : UInt<16>, outputValid : UInt<1>}
    
    reg x : UInt, clock @[GCD.scala 21:15]
    reg y : UInt, clock @[GCD.scala 22:15]
    node _T_9 = gt(x, y) @[GCD.scala 24:10]
    when _T_9 : @[GCD.scala 24:15]
      node _T_10 = sub(x, y) @[GCD.scala 24:24]
      node _T_11 = asUInt(_T_10) @[GCD.scala 24:24]
      node _T_12 = tail(_T_11, 1) @[GCD.scala 24:24]
      x <= _T_12 @[GCD.scala 24:19]
      skip @[GCD.scala 24:15]
    else : @[GCD.scala 25:16]
      node _T_13 = sub(y, x) @[GCD.scala 25:25]
      node _T_14 = asUInt(_T_13) @[GCD.scala 25:25]
      node _T_15 = tail(_T_14, 1) @[GCD.scala 25:25]
      y <= _T_15 @[GCD.scala 25:20]
      skip @[GCD.scala 25:16]
    when io.loadingValues : @[GCD.scala 27:26]
      x <= io.value1 @[GCD.scala 28:7]
      y <= io.value2 @[GCD.scala 29:7]
      skip @[GCD.scala 27:26]
    io.outputGCD <= x @[GCD.scala 32:16]
    node _T_17 = eq(y, UInt<1>("h00")) @[GCD.scala 33:23]
    io.outputValid <= _T_17 @[GCD.scala 33:18]
    
