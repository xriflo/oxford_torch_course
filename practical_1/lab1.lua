--[[
Bratiloveanu Florentina Stefania 
First Lua Tutorial :D
Fotonation 2015
--]]
--[[
q1. Why is the local keyword important? (hint: default variable scope is not local)
a1: Well, maybe we need that variable only in some block and we don't want to make it global and consume the memory :D

q2. What is the difference between a.f() and a:f()? (hint: one implicitly adds self as the first argument)
a2: We use : for instances and not for classes. Actually : brings alive self keyword 

q3.  What does require do, and why do we sometimes capture its return value but sometimes
not? (this is a way to isolate things into namespaces to prevent naming conflicts, related to the answer to why we need to use local)
a3: we use require for caching and avoid running the file multiple times

q4.What is the Lua equivalent of a list object? of a dictionary? How do you iterate over each
of these?
a4.
lists: name = {obj_1, ..., obj_n} and access with name[position] where position >=1
dicts: t = {key1 = 'value1', key2 = false} => t.key1
user pairs function
]]--
----------------------------------------------------
-- 1. Variables and flow control.
----------------------------------------------------

num = 42

s = "ana"
t = 'banana'
u = [[  Multiple
        lines string
    ]]

while num < 50 do
  num = num+1
end

if num > 40 then
  print ('over 40')
elseif s ~= 'ana' then
  io.write('not over 40\n')
else
  thisIsGlobal = 5
  local line = io.read()
  print('Winter is coming'..line)
end

foo = anUnknownVariable
aBoolValue = false

if not aBoolValue then print ('twas false') end
ans = aBoolValue and 'yes' or 'no'

karlSum = 0
for i = 1, 100 do
  karlSum = karlSum + i
end

print(karlSum)
print(2+2)

fredSum = 0
for j = 100, 1, -1 do fredSum = fredSum + j end
print(fredSum)

----------------------------------------------------
-- 2. Functions.
----------------------------------------------------

repeat
 -- print('the way of the future')
  num = num - 1
until num == 0

function fib(n)
  if(n<2) then return 1 end
  return fib(n-2) + fib(n-1)
end

print(fib(1)..'-'..fib(2)..'-'..fib(4))

function adder(x)
  return function (y) return x + y end
end

print(adder(3)(4));


local function func1(x) return x+1 end
function func2(x) return x+1 end
print(func1(99))
print(func2(100))

for i = 0, 9, 1 do
  local j = i + 1
  t = i + 1
  print(j)
end



----------------------------------------------------
-- 3. Tables.
----------------------------------------------------
t = {key1 = 'value1', key2 = false}
t = {ana = 'are mere', ion = "merge cu vaca pe camp" }
print(t.ana)
t.moromete = 'citeste carti'
print(t.moromete)
t.moromete = nil
print(t.moromete)

a = {}
u = {['@!#'] = 'qbert', [a] = 1729, [6.28] = 'tau'}
print(u[a])
print({})
print('----------------------------')
for key, val in pairs(u) do
  print(key, val)
end


v = {1, 2, 4, 8, 16}
for i = 1, #v do
  print(v[i])
end

----------------------------------------------------
-- 3.1 Metatables and metamethods.
----------------------------------------------------
f1 = {a = 1, b = 2}
f2 = {a = 1, b = 2}

metafraction = {}
function metafraction.__add(f1, f2)
  sum = {}
  sum.b = f1.b * f2.b
  sum.a = f1.a*f2.b + f1.b*f2.a
  return sum
end

setmetatable(f1, metafraction)
setmetatable(f2, metafraction)
s = f1 + f2
print(s.a..' and '..s.b)

defaultFavs = {animal = 'gru', food = 'donuts'}
myFavs = {food = 'pizza'}
setmetatable(myFavs, {__index = defaultFavs})
eatenBy = myFavs.animal
print('----------------------------------')
print(myFavs.food)
print('----------------------------------')
for key, val in pairs(defaultFavs) do
  print (key, val)
end

----------------------------------------------------
-- 3.2 Class-like tables and inheritance.
----------------------------------------------------
Dog = {}
function Dog:new()
  newObj = {sound = 'woof'}
  self.__index = self
  return setmetatable(newObj, self)
end
function Dog:makeSound()
  print('I say '..self.sound)
end

LoudDog = Dog:new()

function LoudDog:makeSound()
  s = self.sound..' '
  print(s..s..s)
end

print('--------------------Inheritance--------------------')
seymour = LoudDog:new()                       -- 3.
seymour:makeSound()

function LoudDog:new()
  newObj = {}
  -- set up newObj
  self.__index = self
  return setmetatable(newObj, self)
end

----------------------------------------------------
-- 4. Modules.
----------------------------------------------------

print('--------------------Modules--------------------')

