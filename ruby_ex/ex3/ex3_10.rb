module MyEnumerable
  def ==(x)
    if kind_of?(Hash)
      x.each_with_index{|item, i|
        if self[item[0]].equal?(item[1]) == false
          return false
        end
      }
      return true
    elsif kind_of?(Array)
      x.each_with_index{|item,i|
        if item.equal?(self[i]) == false
          return false
        end
      }
      return true
    end
  end
end

class MyHash < Hash
  include MyEnumerable
end

class MyArray < Array
  include MyEnumerable
end

a = MyArray.new(["one", "two", "three"])
b = MyArray.new(["one", "two", "three"])
p a == b # => F
a = MyArray.new([1, 2, 3])
b = MyArray.new([1, 2, 3])
p a == b # => T

h1 = MyHash[{"one" => 1, "two" => 2}]
h2 = MyHash[{"one" => 1, "two" => 2}]
p h1 == h2 # => T
h1 = MyHash[{:one => 1, :two => 2}]
h2 = MyHash[{:one => 1, :two => 2}]
p h1 == h2 # => T
h1 = MyHash[{:one => "1", :two => "2"}]
h2 = MyHash[{:one => "1", :two => "2"}]
p h1 == h2 # => F
h1 = MyHash[{:two => 2, :one => 1}]
h2 = MyHash[{:one => 1, :two => 2}]
p h1 == h2 # => T
