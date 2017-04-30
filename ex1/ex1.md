# 課題1

## 課題1-1
---
外部ライブラリとして
Humanクラスを定義したhuman.rbを用意する。
<pre class=“prettyprint linenums:”>
class Human
  def initialize(name)
    @name = name
  end

  def profile
    puts "My Name is #{@name}"
  end
end</pre>
human.rbをインポートしてNewStudentクラスを定義し
Jackという名を持つ人間が自己紹介(profile)と
挨拶(greet)をするプログラムは以下のようになる。
<pre class=“prettyprint linenums:”>
require './human'

class NewStudent < Human #Humanを継承するNewStudentを定義
  def greet
    puts "Hi, I'm a student"
  end
end

s = NewStudent.new("Jack")
s.profile
s.greet </pre>

実行結果は下記の通りである。
<pre class=“prettyprint linenums:0”>
h183:Ruby_ex kataoka$ ruby ex1_1.rb
My Name is Jack
Hi, I'm a student</pre>

## 課題1-2
---
### Q：プログラムを書く際になぜクラス継承を用いる必要があるのか。クラス継承を用いなかった場合にどのようなデメリットがありうるのか。
---
世の中には様々な人間(Human)が存在する。
職業別に分類した場合、学生(Student)や会社員(Office Worker)などが考えられる。学生クラスと会社員クラスを両方作成する場合、学生クラスの中で人間に共通する属性(年齢や性別)を毎回定義するよりも、人間をプロトタイプとして差分(大学名や学部学科など学生固有の属性)を学生クラスの中で定義する方が効率的である。具体的には、コードを毎回書く手間が省ける、会社員クラスなど別のクラスを生成するときに人間クラスを再利用できる利点などが挙げられる。
もし、人間クラスを使わない場合(クラス継承を用いなかった場合)、学生クラスでprofileを定義し、別の会社員クラスを作りたいと思ったときにprofileを再び書く必要がある。さらにprofileの中身を変更したいときに両クラスの中身を変更する必要がある。コード量の観点、保守性の観点からクラス継承を用いることが望ましい。

<pre class=“prettyprint linenums:”>
require './human'

class NewStudent < Human #Humanを継承するNewStudentを定義
  def greet
    puts "Hi, I'm a student"
  end
end

s = NewStudent.new("Jack")
s.profile
s.greet </pre>

## 課題1-3
---
実装は以下のようになる。
<pre class=“prettyprint linenums:”>
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
s.profile</pre>

実行結果は以下の通りである。
<pre class=“prettyprint linenums:0”>
h183:Ruby_ex kataoka$ ruby ex1_3.rb
Hello! I'm Jack. I'm a student.</pre>

Humanクラスのprofileではなく、
その子クラスのNewStudent2のprofileが実行されることが確認できた。
これはprofileをもつHumanクラスを継承する複数のクラスが存在し、
NewStudentクラスにのみ特有のprofileを実行したい状況において
子クラスのprofileを優先的に実行される方が、効率的であるからだと考えられる。

## 課題1-4
---
下の例では、文字列s = "This is a message"に対して
メッセージlength,object_idを送っており、
それぞれsの文字長、sのobjectIDを返している。
また、クラスHumanに対してメッセージclassを送ることにより
Humanの型がClass型であるという返答が得られる。
<pre class=“prettyprint linenums:”>
require './human'

s = "This is a message"
puts s.length
puts s.object_id

puts Human.class
puts s.class</pre>

実際の実行結果が以下の通りである。
<pre class=“prettyprint linenums:0”>
h183:Ruby_ex kataoka$ ruby ex1_4.rb
17
70096039248980
Class
String</pre>
