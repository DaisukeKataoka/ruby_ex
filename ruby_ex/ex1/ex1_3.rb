require './human'

class NewStudent2 < Human
  def profile
    puts "Hello! I'm #{@name}. I'm a student."
  end

  def greet
    puts "Hi, I am a student"
  end
end

s = NewStudent2.new("Jack")
s.profile
