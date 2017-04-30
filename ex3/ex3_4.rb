class A
  def n
    puts "OK"
  end
  private:n

  def call_n(a)
    puts "private"
    n # a1がa1に対してnを実行 self.n
    a.n # a1がa2に対してnを実行
  end
end

a1 = A.new
a2 = A.new
a1.call_n(a2) #クラスA内のメソッドからならmを呼び出せる
