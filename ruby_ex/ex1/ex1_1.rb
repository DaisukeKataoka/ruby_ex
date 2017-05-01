require './human'

class NewStudent < Human #Humanを継承するNewStudentを定義
  def greet
    puts "Hi, I'm a student"
  end
end

s = NewStudent.new("Jack")
s.profile
s.greet
