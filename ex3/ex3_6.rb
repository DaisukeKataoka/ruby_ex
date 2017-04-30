class Person
  @@population = 0 #class variable

  def self.get_population # class method
    @@population += 1
  end

  def add_children(number) # class method
    return @@population += number
  end
end

puts Person.new.add_children(3)
puts Person.get_population
=begin
puts "Total population is #{total_population}" #文字列中で#{}すると文字列に変換？
puts "Total population is #{total_population}"
=end
