module HasName
  def >(name1)
    if (@name > name1) == true then
      return @name
    elsif (@name < name1) == true
      return name1
    end
  end

  def initial(name)
    return name[0]
  end

  def capital_name(name)
    return name.upcase
  end
end

class Person
  include HasName
  def initialize(name)
    @name = name
  end

  def compare(name1)
    #puts @name.>(name1)
    puts @name > name1
  end

  def return_initial
    puts initial(@name)
  end

  def return_capital_name
    puts capital_name(@name)
  end
end

class City
  include HasName
  def initialize(name)
      @name = name
  end
end

jack = Person.new("Jack")
jack.compare("kaito")
jack > "kaito"
jack.return_initial()
jack.return_capital_name()

#puts "hoge" > "fuga" #=> true
#puts "yamamoto"[0] #=> "y"
#puts "hoge".upcase #=> "HOGE"
