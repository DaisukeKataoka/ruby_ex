class Human
  def initialize(name)
    @name = name
  end
end

class Professor < Human
  def profile
    puts "My Name is #{@name}, I'm a professor."
  end
end

class Student < Human
  def profile
    puts "My Name is #{@name}, I'm a student."
  end
end

l=[]
l.push(Professor.new("Katsumi"))
l.push(Student.new("Daisuke"))
l.each do |who|
  who.profile
end
