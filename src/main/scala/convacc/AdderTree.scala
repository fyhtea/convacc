// See LICENSE.txt for license details.
package convacc

import chisel3._
import chisel3.util._
import scala.collection.mutable.ArrayBuffer

// Problem:
//
// Count incoming trues
// (increase counter every clock if 'in' is asserted)
//
class AdderTree(vecsize:Int, bitw:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(Vec(vecsize, SInt(bitw.W)))
    val out = Output(SInt(bitw.W))
  })
  
  
  val vecStage = ArrayBuffer[List[SInt]]()
  vecStage.append(io.in.toList)
  
    while(vecStage.last.size != 1){
        val newStage = vecStage.last.grouped(2).map(x => {
            if(x.size == 2) x(0)+x(1)
            else x(0)
        }).toList
        vecStage.append(newStage)
    }
    io.out := vecStage.last(0)
}


