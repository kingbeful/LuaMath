# LuaMath

**LuaMath** is a pure lua library. It supports matirx and vector operations which can be used in OpenGL.

# Usage

### Vector

```lua
vector = require 'Vector'
-- using the vec3
local vec3 = vector.vec3
-- create a vector which has 3 values
a = vec3(1,2,4)
b = vec3(2,2,2)
-- add
print(a+b) -- output <3,4,6>
-- sub
print(a-b) -- output <-1,0,2>
-- mul
print(a*b) -- output <2,4,8>
-- div
print(a/b) -- output <0.5,1,2>
-- normalize
v = vec3(10,10,10)
print(vector.normalize3(v)) -- output <0.57735026918963,0.57735026918963,0.57735026918963>
-- cross product
u = vec3(10,10,0)
v = vec3(-10,10,0)
print(vector.cross3(v,u))  -- output <0,0,-200>
```

### Matrix

```lua
vector = require 'Vector'
-- using the vec3
local vec4 = vector.vec4
matrix = require 'Matrix'
local mat4 = matrix.mat4
-- create matrix
a = mat4(1,2,3,4,
         1,2,3,4,
         1,2,3,4,
         1,2,3,4)
b = mat4(1,1,1,1,
         2,2,2,2,
         3,3,3,3,
         4,4,4,4)
-- multiple 2 mat4 type Matrix
print(a*b)
-- output
--[[
[30.0 30.0 30.0 30.0 ]
[30.0 30.0 30.0 30.0 ]
[30.0 30.0 30.0 30.0 ]
[30.0 30.0 30.0 30.0 ]
--]]
-- multiple a vec4 type Vector
b = vec4(1,2,3,4)
print(a*b) -- output <30,30,30,30>

-- Translate a Vector
b = vec4(2,2,0,1)
print(matrix.translate(1,2,1)*b) -- output <3,4,1,1>
-- Scale a Vector
print(matrix.scale(1,2,1)*b) -- output <2,4,0,1>
-- Rotate a Vector
print(matrix.rotate4z(math.pi/2)*b) -- output <-2,2,0,1>
```




# Test

Download the files and run the command below in the console

```bash

lua test.lua

```

# License

The MIT License (MIT)

Copyright (c) 2016 Kevin Qian and other contributors

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
