class MyHash < Hash
  def ==(x)
    x.each_with_index{|item, i|
      if self[item[0]].equal?(item[1]) == false
        return false
      end
    }
    return true
  end
end

h1 = MyHash[{"one" => 1, "two" => 2}]
h2 = MyHash[{"one" => 1, "two" => 2}]
puts h1 == h2
h1 = MyHash[{:one => 1, :two => 2}]
h2 = MyHash[{:one => 1, :two => 2}]
puts h1 == h2
h1 = MyHash[{:one => "1", :two => "2"}]
h2 = MyHash[{:one => "1", :two => "2"}]
puts h1 == h2
h1 = MyHash[{:two => 2, :one => 1}]
h2 = MyHash[{:one => 1, :two => 2}]
puts h1 == h2
