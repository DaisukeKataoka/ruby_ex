a = Array.new(["one", "two", "three"])
b = Array.new(["one", "two", "three"])

p a == b

class Array
  def ==(x)
    count = 0
    x.each_with_index {|item,i|
      if item.equal?(self[i])
        count += 1
      end
    }
    if x.length == count
      return true
    else
      return false
    end
  end
end

a = Array.new(["one", "two", "three"])
b = Array.new(["one", "two", "three"])

p a == b
