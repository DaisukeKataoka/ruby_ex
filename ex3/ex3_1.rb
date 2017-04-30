class A
  def m
    puts "OK"
  end
  protected:m

  def call_m(a)
    puts "protected"
    a.m # オブジェクトaのサブクラスのaのメソッド
  end
end

a = A.new
a.call_m(a) #クラスA内のメソッドからならmを呼び出せる
