class Human
  def initialize(name, occupation)
    @name = name
    @occupation = occupation
  end
  attr_reader :occupation

  def professor_profile
    puts "My Name is #{@name}, I'm a professor"
  end

  def student_profile
    puts "My Name is #{@name}, I'm a student."
  end
end

l = []
l.push(Human.new("Katsumi", "Professor"))
l.push(Human.new("Daisuke", "Student"))

l.each do |who|
  if who.occupation == "Professor"
    who.professor_profile()
  elsif who.occupation == "Student"
    who.student_profile()
  end
end

# どのメソッドが実行されるかは実行時までわからない
