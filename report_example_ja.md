# 情報システム論実習 (2017年度) オブジェクト指向計算演習（1）

<p style="text-align: right;">
2017年XX月XX日
<br>
XXXX講座 XXXX分野
<br>
Your name (your@email.address)
<br>
6930-XX-XXXX
</p>


## 課題1-1

"hello"と画面に表示する`greet`メソッドを持つ，`Hello`クラスを作成せよ．

### コード

```ruby
class Hello
  def greet()
    puts 'hello'
  end
end

hello = Hello.new()
hello.greet()
```
### 出力

```
hello
```

### 考察

`Hello` クラスは `class Name ... end` and `def Name ...end` といった Ruby の基本的な構文を使って実装できる．
`Hello.new()` によって `Hello` クラスのインスタンスを作成し，`greet` メソッドを呼ぶことで "hello" を出力できる．

## 課題1-2

<課題についての簡単な説明>

### コード
```ruby
<Ruby による解答コード>
```

### 出力

```
<解答コードの実行出力例>
```

### 考察

課題についての考察

...