class A
  def m
    puts "m of A"
  end
end

class B < A
  def n
    puts "n of B"
  end

  def m #オーバーライド
    puts "m of B"
    super
    self.n
  end
end

class C < B
  def n
    puts "n of C"
    super
  end
end

c = C.new
c.m
