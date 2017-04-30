class Human
  def initialize(name)
    @name = name
  end

  def profile
    puts "I'm #{@name}"
  end
end

class Student
  def initialize(name, id)
    @name = name
    @id = id
  end

  def profile
    puts "I'm #{@name}"
    puts "My Student ID is #{@id}"
  end
end

class NewStudent2 < Human
  def initialize(name, id)
    super(name)
    @id = id
  end

  def profile
    super()
    puts "My Student ID is #{@id}"
  end
end

s = Student.new("Jack", 100)
s.profile
t = NewStudent2.new("Sally", 200)
t.profile
