--[[
q1.What is the difference between a Tensor and a Storage?
a1. Tensor is the make-up of the storage, it manipulates the storage on your behalf
]]--


require "torch"
z = torch.Tensor(4, 5, 6, 2)

s = torch.LongStorage(6)
s[1] = 4; s[2] = 5; s[3] = 6; s[4] = 2; s[5] = 7; s[6] = 3;
x = torch.Tensor(s)
print(x:nDimension())
print(1)

-- init tensors
x = torch.Tensor(4, 5, 2)
s = x:storage()
for i=1,s:size() do
  s[i] = i
end
--print(x)

x = torch.Tensor(4)
i = 0

x:apply(function()
    i = i + 1
    return 3.14
end)
x[1] = 2
print(x)
--print(x:stride())

print('----------------------------')
x = torch.Tensor(torch.LongStorage({4,4,3,2}))



s = torch.Storage(10):fill(1)
x = torch.Tensor(s, 1, torch.LongStorage{2,5})
print(x)




--[[ Handin ]]--
local t = torch.Tensor({{1,2,3},{4,5,6},{7,8,9}})
print('==========for line==========')
print(t[2])
print(t:select(1,2))
mask = torch.ByteTensor(3,3):fill(0)
for i=1,3 do mask[2][i] = 1 end
print(t:maskedSelect(mask))
print('=================================')
