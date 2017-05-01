class A
  def m
    puts "OK"
  end
  protected:m

  def call_m(a)
    puts "protected"
    a.m # オブジェクトaのメソッドを呼び出す
  end
end

a = A.new
a.m #しかし、インスタンス
