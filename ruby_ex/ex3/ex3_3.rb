class A
  def n
    puts "OK"
  end
  private:n

  def call_n(a)
    puts "private"
    n # a.nとは違う
  end
end

a = A.new
a.call_n(a) #クラスA内のメソッドからならmを呼び出せる
