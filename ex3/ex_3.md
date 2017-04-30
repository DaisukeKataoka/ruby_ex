# 情報システム論実習 (2017年度) オブジェクト指向計算演習（3）

<p style="text-align: right;">
2017年4月27日
<br>
社会情報モデル講座  
ソーシャルメディアユニット
<br>
片岡 大祐(kataoka@dl.soc.i.kyoto-u.ac.jp)
<br>
6930-29-8362
</p>


## 課題3-1


### コード

```ruby
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
```
### 出力

```
h9:ex2 kataoka$ ruby ex2_1.rb
My Name is Katsumi, I'm a professor.
My Name is Daisuke, I'm a student.
```

### 考察
2-1と2-2をまとめて考察する(2-2で記述)

## 課題2-2


### コード
```ruby
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
```

### 出力

```
h9:ex2 kataoka$ ruby ex2_2.rb
My Name is Katsumi, I'm a professor
My Name is Daisuke, I'm a student.
```

### 考察
あるリストは、複数のHumanクラスやそのサブクラス(例えばStudentやProfessorなど)のインスタンスからなると仮定する。さらに職業ごとに人物が挨拶するメソッドを追加することを想定する(例えばStudentは"I'm a student"、Professorは"I'm a professor")。

このとき、多層性を使わない課題2-2の場合は、Humanクラス内に職業ごとに複数のメソッドを用意し、Humanクラスに属性occupationを付与し、属性の種類ごとに条件分岐で呼び出すメソッドを変更する必要がある。このとき、職業の種類が増えるに従ってメソッドを新しく定義し、条件分岐を増やす必要がある。

一方、多層性を用いる課題2-1の場合は、クラスごとにprofileメソッドを定義することで、条件分岐を書く必要をなくした。つまり、オブジェクトの種類を気にする必要がなくなる。super()を使えばさらに記述量を減らすことが可能である。

## 課題2-3


### コード
```ruby
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
```

### 出力

```
I'm Jack
My Student ID is 100
I'm Sally
My Student ID is 200
```

### 考察
superメソッドを使ったNewStudent2と使わないStudentで同じ振る舞いをすることが確かめられた。

## 課題2-4


### コード
```ruby
class A
  def m
    puts "m of A"
  end
end

class B < A
  def n
    puts "n of B"
  end

  def m #オーバーライド
    puts "m of B"
    super
    self.n
  end
end

class C < B
  def n
    puts "n of C"
    super
  end
end

c = C.new
c.m
```

### 出力

```
m of B
m of A
n of C
n of B
```

### 考察
Cのインスタンスに対しメソッドmを呼び出した場合、初めに"m of B"が出力されていることから、クラスBのメソッドmを呼び出したことが確認できる。次に、クラスBからsuperメソッドを呼び出しているため、クラスAのメソッドmが実行されている。さらにクラスBのメソッドmではself.nを呼び出しているが、この際クラスBとクラスCで両方とも定義されているメソッドnのうち*クラスCのメソッドn*が呼び出されている。最後にクラスCはsuperメソッドを呼び出しており、クラスBのメソッドnが実行されている。そのため上記のような出力が得られた。

## 課題2-5


### コード
```ruby
class MyArray < Array
  def ==(x)
    count = 0
    x.each_with_index{|item,i|
      if item.equal?(self[i])
        count += 1
      end
    }
    if x.length.eql?(count)
      return true
    else
      return false
    end
  end
end

a = Array.new(["one", "two", "three"])
b = Array.new(["one", "two", "three"])

p a == b # => T

a = MyArray.new(["one", "two", "three"])
b = MyArray.new(["one", "two", "three"])

p a == b # => F

a = MyArray.new([1, 2, 3])
b = MyArray.new([1, 2, 3])

p a == b # => T
```

### 出力

```
h9:ex2 kataoka$ ruby ex2_5.rb
true
false
true
```

### 考察
まずMyArrayでは、each_with_indexメソッドを追加し
リスト内の全ての要素に関して同様の処理ができるようにした。
さらにAとBが異なるオブジェクトかどうかを調べるA.equal?(B)を追加し
与えられた二つのリストの各要素オブジェクトが等しいかどうかを調べ、
リストの中で等しいオブジェクトの数をカウントした。
最後に全てのオブジェクトが等しければ、リストの要素数と等しくなるので、
リストの要素数と等しいオブジェクト数のカウントが一致すればtrue、
等しくなければfalseを返した。

## 課題2-6


### コード
```ruby
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
```

### 出力

```
true
false
```

### 考察
Arrayクラスの`==`を定義する前と後で文字列オブジェクトからなるリストaとbが
等しいかどうかの判定がどう変わるかを確認した。
2-5と同じ`==`の定義をArrayクラスにメソッドとして追加し、
追加する前はaとbが一致しているが、追加後はaとbが一致していない
ことを確認した(つまり値としては同じだが、異なるオブジェクトであること)。
