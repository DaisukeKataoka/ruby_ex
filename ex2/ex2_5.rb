class MyArray < Array
  def ==(x)
    count = 0
    x.each_with_index{|item,i|
      if item.equal?(self[i])
        count += 1
      end
    }
    if x.length.eql?(count)
      return true
    else
      return false
    end
  end
end

a = Array.new(["one", "two", "three"])
b = Array.new(["one", "two", "three"])

p a == b # => T

a = MyArray.new(["one", "two", "three"])
b = MyArray.new(["one", "two", "three"])

p a == b # => F

a = MyArray.new([1, 2, 3])
b = MyArray.new([1, 2, 3])

p a == b # => T
