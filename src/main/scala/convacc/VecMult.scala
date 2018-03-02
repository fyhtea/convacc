package convacc

import chisel3._
import chisel3.core.{Bundle, Module}
import chisel3.util._
/**
  * 
  * 
  * 
  */
  class VecMult(d:Int, bitwidth:Int) extends Module {
  val io = IO(new Bundle {
    val in1 = Input(Vec(d, SInt(bitwidth.W)))
    val in2 = Input(Vec(d, SInt(bitwidth.W)))
    val out = Output(Vec(d, SInt(bitwidth.W)))
  })
  for (i <- 0 until d) {
    io.out(i) := io.in1(i) * io.in2(i)
  }
}


