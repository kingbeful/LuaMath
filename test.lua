local vector = require 'Vector'
local vec2 = vector.vec2
local vec3 = vector.vec3
local vec4 = vector.vec4

a = vec2(1,2)
b = vec2(2,2)

if tostring(a) ~= '<1,2>' then
  error('tostring(a) = ' .. tostring(a))
else
  print('vec2 init test','Passed')
end

if tostring(a+b) ~= '<3,4>' then
  error('tostring(a+b) = ' .. tostring(a+b))
else
  print('vec2 add test', 'Passed')
end

if tostring(a-b) ~= '<-1,0>' then
  error('tostring(a-b) = ' .. tostring(a-b))
else
  print('vec2 sub test', 'Passed')
end

if tostring(a*b) ~= '<2,4>' then
  error('tostring(a*b) = ' .. tostring(a*b))
else
  print('vec2 mul test 1', 'Passed')
end

if tostring(a*2) ~= '<2,4>' then
  error('tostring(a*2) = ' .. tostring(a*2))
else
  print('vec2 mul test 2', 'Passed')
end

if tostring(a/b) ~= '<0.5,1>' then
  error('tostring(a/b) = ' .. tostring(a/b))
else
  print('vec2 div test 1', 'Passed')
end

if tostring(a/2) ~= '<0.5,1>' then
  error('tostring(a/2) = ' .. tostring(a/2))
else
  print('vec2 div test 2', 'Passed')
end

a = vec3(1,2,4)
b = vec3(2,2,2)

if tostring(a) ~= '<1,2,4>' then
  error('tostring(a) = ' .. tostring(a))
else
  print('vec3 init test','Passed')
end

if tostring(a+b) ~= '<3,4,6>' then
  error('tostring(a+b) = ' .. tostring(a+b))
else
  print('vec3 add test', 'Passed')
end

if tostring(a-b) ~= '<-1,0,2>' then
  error('tostring(a-b) = ' .. tostring(a-b))
else
  print('vec3 sub test', 'Passed')
end

if tostring(a*b) ~= '<2,4,8>' then
  error('tostring(a*b) = ' .. tostring(a*b))
else
  print('vec3 mul test 1', 'Passed')
end

if tostring(a*2) ~= '<2,4,8>' then
  error('tostring(a*2) = ' .. tostring(a*2))
else
  print('vec3 mul test 2', 'Passed')
end

if tostring(a/b) ~= '<0.5,1,2>' then
  error('tostring(a/b) = ' .. tostring(a/b))
else
  print('vec3 div test 1', 'Passed')
end

if tostring(a/2) ~= '<0.5,1,2>' then
  error('tostring(a/2) = ' .. tostring(a/2))
else
  print('vec3 div test 2', 'Passed')
end

local v = vec3(10,10,10)
if tostring(vector.normalize3(v)) ~= '<0.57735026918963,0.57735026918963,0.57735026918963>' then
  error('tostring(vector.normalize3(v)) = ' .. tostring(vector.normalize3(v)))
else
  print('vec3 normalize test', 'Passed')
end

local u = vec3(10,10,0)
local v = vec3(-10,10,0)
if tostring(vector.cross3(u,v)) ~= '<0,-0,200>' then
  error('tostring(vector.cross3(u,v)) = ' .. tostring(vector.cross3(u,v)))
else
  print('vec3 cross test 1', 'Passed')
end

if tostring(vector.cross3(v,u)) ~= '<0,0,-200>' then
  error('tostring(vector.cross3(v,u)) = ' .. tostring(vector.cross3(v,u)))
else
  print('vec3 cross test 2', 'Passed')
end


a = vec4(1,2,4,8)
b = vec4(2,2,2,2)

if tostring(a) ~= '<1,2,4,8>' then
  error('tostring(a) = ' .. tostring(a))
else
  print('vec4 init test','Passed')
end

if tostring(a+b) ~= '<3,4,6,10>' then
  error('tostring(a+b) = ' .. tostring(a+b))
else
  print('vec4 add test', 'Passed')
end

if tostring(a-b) ~= '<-1,0,2,6>' then
  error('tostring(a-b) = ' .. tostring(a-b))
else
  print('vec4 sub test', 'Passed')
end

if tostring(a*b) ~= '<2,4,8,16>' then
  error('tostring(a*b) = ' .. tostring(a*b))
else
  print('vec4 mul test 1', 'Passed')
end

if tostring(a*2) ~= '<2,4,8,16>' then
  error('tostring(a*2) = ' .. tostring(a*2))
else
  print('vec4 mul test 2', 'Passed')
end

if tostring(a/b) ~= '<0.5,1,2,4>' then
  error('tostring(a/b) = ' .. tostring(a/b))
else
  print('vec4 div test 1', 'Passed')
end

if tostring(a/2) ~= '<0.5,1,2,4>' then
  error('tostring(a/2) = ' .. tostring(a/2))
else
  print('vec4 div test 2', 'Passed')
end


local Mat = require 'Matrix'
local mat2 = Mat.mat2

a = mat2(1,2,3,4)

if tostring(a) ~= '[ 1.0  2.0 ]\n[ 3.0  4.0 ]' then
  error('tostring(a) = \n' .. tostring(a))
else
  print('mat2 init test','Passed')
end

b = mat2(1,1,2,2)

if tostring(a*b) ~= '[ 5.0  5.0 ]\n[11.0 11.0 ]' then
  error('tostring(a*b) = \n' .. tostring(a*b))
else
  print('mat2 mul test 1','Passed')
end

b = vec2(2,2)

if tostring(a*b) ~= '<6,14>' then
  error('tostring(a*b) = \n' .. tostring(a*b))
else
  print('mat2 mul test 2','Passed')
end

if tostring(a*2) ~= '[ 2.0  4.0 ]\n[ 6.0  8.0 ]' then
  error('tostring(a*2) = \n' .. tostring(a*2))
else
  print('mat2 mul test 3','Passed')
end


local mat3 = Mat.mat3

a = mat3(1,2,3,
         1,2,3,
         1,2,3)

if tostring(a) ~= '[ 1.0  2.0  3.0 ]\n[ 1.0  2.0  3.0 ]\n[ 1.0  2.0  3.0 ]' then
  error('tostring(a) = \n' .. tostring(a))
else
  print('mat3 init test','Passed')
end

b = mat3(1,1,1,2,2,2,3,3,3)

if tostring(a*b) ~= '[14.0 14.0 14.0 ]\n[14.0 14.0 14.0 ]\n[14.0 14.0 14.0 ]' then
  error('tostring(a*b) = \n' .. tostring(a*b))
else
  print('mat3 mul test 1','Passed')
end

b = vec3(1,2,3)

if tostring(a*b) ~= '<14,14,14>' then
  error('tostring(a*b) = \n' .. tostring(a*b))
else
  print('mat3 mul test 2','Passed')
end

if tostring(a*2) ~= '[ 2.0  4.0  6.0 ]\n[ 2.0  4.0  6.0 ]\n[ 2.0  4.0  6.0 ]' then
  error('tostring(a*2) = \n' .. tostring(a*2))
else
  print('mat3 mul test 3','Passed')
end

local mat4 = Mat.mat4

a = mat4(1,2,3,4,
         1,2,3,4,
         1,2,3,4,
         1,2,3,4)

if tostring(a) ~= '[ 1.0  2.0  3.0  4.0 ]\n[ 1.0  2.0  3.0  4.0 ]\n[ 1.0  2.0  3.0  4.0 ]\n[ 1.0  2.0  3.0  4.0 ]' then
  error('tostring(a) = \n' .. tostring(a))
else
  print('mat4 init test','Passed')
end

b = mat4(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4)

if tostring(a*b) ~= '[30.0 30.0 30.0 30.0 ]\n[30.0 30.0 30.0 30.0 ]\n[30.0 30.0 30.0 30.0 ]\n[30.0 30.0 30.0 30.0 ]' then
  error('tostring(a*b) = \n' .. tostring(a*b))
else
  print('mat4 mul test 1','Passed')
end

b = vec4(1,2,3,4)

if tostring(a*b) ~= '<30,30,30,30>' then
  error('tostring(a*b) = \n' .. tostring(a*b))
else
  print('mat4 mul test 2','Passed')
end

if tostring(a*2) ~= '[ 2.0  4.0  6.0  8.0 ]\n[ 2.0  4.0  6.0  8.0 ]\n[ 2.0  4.0  6.0  8.0 ]\n[ 2.0  4.0  6.0  8.0 ]' then
  error('tostring(a*2) = \n' .. tostring(a*2))
else
  print('mat4 mul test 3','Passed')
end

b = vec4(2,2,0,1)

if tostring(Mat.translate(1,2,1)*b) ~= '<3,4,1,1>' then
  error('tostring(Mat.translate(1,2,1)*b) = \n' .. tostring(Mat.translate(1,2,1)*b))
else
  print('mat4 translate test','Passed')
end

if tostring(Mat.scale(1,2,1)*b) ~= '<2,4,0,1>' then
  error('tostring(Mat.scale(1,2,1)*b) = \n' .. tostring(Mat.scale(1,2,1)*b))
else
  print('mat4 scale test','Passed')
end


if tostring(Mat.rotate4z(math.pi/2)*b) ~= '<-2,2,0,1>' then
  error('tostring(Mat.rotate4z(math.pi/2)*b) = \n' .. tostring(Mat.rotate4z(math.pi/2)*b))
else
  print('mat4 rotate4z test','Passed')
end
