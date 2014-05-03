package algorithms

object multiplication {;import org.scalaide.worksheet.runtime.library.WorksheetSupport._; def main(args: Array[String])=$execute{;$skip(1002); 
  def multiply(x: Int, y: Int): Int = {
    def multiplyIter(x: Int, y: Int): Int = {
      /* x = ab; y = cd */
      var x_str = x.toString
      var y_str = y.toString
      var b_str = x_str.substring(x_str.length / 2)
      var d_str = y_str.substring(y_str.length / 2)

      var b = b_str.toInt
      var a = (x - b)/math.pow(10,b_str.length).toInt
      var d = d_str.toInt
      var c = (y - d)/math.pow(10,d_str.length).toInt

      var x_len = (x_str.length - x_str.length / 2) * 2
      var y_len = (y_str.length - y_str.length / 2) * 2
      var max_len =
        if (x_len > y_len) x_len else y_len
      println("x = " + x + "; y = " + y + "; a = " + a + "; b = " + b + "; c = " + c + "; d = " + d + "; max_len = " + max_len)
      if (max_len/2 == 1) x * y else
        multiplyIter(a, c) * math.pow(10,max_len).toInt + multiplyIter(b,d) + (multiplyIter(b,c) + multiplyIter(a,d)) * math.pow(10,max_len/2).toInt
    }
    multiplyIter(x,y)
  };System.out.println("""multiply: (x: Int, y: Int)Int""");$skip(20); val res$0 = 
  multiply(100,456);System.out.println("""res0: Int = """ + $show(res$0))}
}
