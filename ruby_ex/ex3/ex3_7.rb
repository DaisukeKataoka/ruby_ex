module M
end

module MM
  include M
end

module N
end

module NN
end

class A
end

class B < A
  include N
end

class C < B
  include M
  puts ancestors
end
