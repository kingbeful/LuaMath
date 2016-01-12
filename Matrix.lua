local Vec = require 'Vector'

local vec2, vec3, vec4 = Vec.vec2, Vec.vec3, Vec.vec4

local mat2
mat2 = setmetatable({}, {
    __call = function (t, m11, m21, m12, m22) return setmetatable({_type = 'mat2', m11=m11, m12=m12, m21=m21, m22=m22}, {
        -- __add = function(a, b) return mat2(a.x + b.x, a.y + b.y) end,
        -- __sub = function(a, b) return mat2(a.x - b.x, a.y - b.y) end,
        __mul = function(a, b)
            if type(b) == 'table' and b._type == 'mat2' then
                return mat2(a.m11*b.m11 + a.m21*b.m12,  a.m11*b.m21 + a.m21*b.m22,
                            a.m12*b.m11 + a.m22*b.m12,  a.m12*b.m21 + a.m22*b.m22)
            elseif type(b) == 'table' and b._type == 'vec2' then
                return vec2(a.m11*b.x + a.m21*b.y,
                            a.m12*b.x + a.m22*b.y)
            elseif type(b) == 'number' then
                return mat2(a.m11 * b, a.m21 * b,
                            a.m12 * b, a.m22 * b)
            else
                error('Unsupported input in mat2 __mul')
            end
        end,
        __tostring = function(m) return string.format("[%4.1f %4.1f ]\n[%4.1f %4.1f ]",
                                                  m.m11, m.m21,   m.m12, m.m22) end
    }) end,
})

local mat3
mat3 = setmetatable({}, {
    __call = function (t,
        m11, m21, m31,
        m12, m22, m32,
        m13, m23, m33)
    return setmetatable({
        _type = 'mat3',
        m11=m11, m21=m21, m31=m31,
        m12=m12, m22=m22, m32=m32,
        m13=m13, m23=m23, m33=m33 }, {
        -- __add = function(a, b) return mat3(a.x + b.x, a.y + b.y) end,
        -- __sub = function(a, b) return mat3(a.x - b.x, a.y - b.y) end,
        __mul = function(a, b)
            if type(b) == 'table' and b._type == 'mat3' then
                return mat3(
                    a.m11*b.m11 + a.m21*b.m12 + a.m31*b.m13,  a.m11*b.m21 + a.m21*b.m22 + a.m31*b.m23,  a.m11*b.m31 + a.m21*b.m32 + a.m31*b.m33,
                    a.m12*b.m11 + a.m22*b.m12 + a.m32*b.m13,  a.m12*b.m21 + a.m22*b.m22 + a.m32*b.m23,  a.m12*b.m31 + a.m22*b.m32 + a.m32*b.m33,
                    a.m13*b.m11 + a.m23*b.m12 + a.m33*b.m13,  a.m13*b.m21 + a.m23*b.m22 + a.m33*b.m23,  a.m13*b.m31 + a.m23*b.m32 + a.m33*b.m33)
            elseif type(b) == 'table' and b._type == 'vec3' then
                return vec3(
                    a.m11*b.x + a.m21*b.y + a.m31*b.z,
                    a.m12*b.x + a.m22*b.y + a.m32*b.z,
                    a.m13*b.x + a.m23*b.y + a.m33*b.z)
            elseif type(b) == 'number' then
                return mat3(
                    a.m11 * b, a.m21 * b, a.m31 * b,
                    a.m12 * b, a.m22 * b, a.m32 * b,
                    a.m13 * b, a.m23 * b, a.m33 * b)
            else
                error('Unsupported input in mat3 __mul')
            end
        end,
        __tostring = function(m) return string.format("[%4.1f %4.1f %4.1f ]\n[%4.1f %4.1f %4.1f ]\n[%4.1f %4.1f %4.1f ]",
                           m.m11, m.m21, m.m31,  m.m12, m.m22, m.m32,  m.m13, m.m23, m.m33) end
    }) end,
})

local mat4
mat4 = setmetatable({}, {
    __call = function (t,
        m11, m21, m31, m41,
        m12, m22, m32, m42,
        m13, m23, m33, m43,
        m14, m24, m34, m44)
    return setmetatable({
        _type = 'mat4',
        m11=m11, m21=m21, m31=m31, m41=m41,
        m12=m12, m22=m22, m32=m32, m42=m42,
        m13=m13, m23=m23, m33=m33, m43=m43,
        m14=m14, m24=m24, m34=m34, m44=m44 }, {
        -- __add = function(a, b) return mat4(a.x + b.x, a.y + b.y) end,
        -- __sub = function(a, b) return mat4(a.x - b.x, a.y - b.y) end,
        __mul = function(a, b)
            if type(b) == 'table' and b._type == 'mat4' then
                return mat4(
        a.m11*b.m11 + a.m21*b.m12 + a.m31*b.m13 + a.m41*b.m14,
        a.m11*b.m21 + a.m21*b.m22 + a.m31*b.m23 + a.m41*b.m24,
        a.m11*b.m31 + a.m21*b.m32 + a.m31*b.m33 + a.m41*b.m34,
        a.m11*b.m41 + a.m21*b.m42 + a.m31*b.m43 + a.m41*b.m44,

        a.m12*b.m11 + a.m22*b.m12 + a.m32*b.m13 + a.m42*b.m14,
        a.m12*b.m21 + a.m22*b.m22 + a.m32*b.m23 + a.m42*b.m24,
        a.m12*b.m31 + a.m22*b.m32 + a.m32*b.m33 + a.m42*b.m34,
        a.m12*b.m41 + a.m22*b.m42 + a.m32*b.m43 + a.m42*b.m44,

        a.m13*b.m11 + a.m23*b.m12 + a.m33*b.m13 + a.m43*b.m14,
        a.m13*b.m21 + a.m23*b.m22 + a.m33*b.m23 + a.m43*b.m24,
        a.m13*b.m31 + a.m23*b.m32 + a.m33*b.m33 + a.m43*b.m34,
        a.m13*b.m41 + a.m23*b.m42 + a.m33*b.m43 + a.m43*b.m44,

        a.m14*b.m11 + a.m24*b.m12 + a.m34*b.m13 + a.m44*b.m14,
        a.m14*b.m21 + a.m24*b.m22 + a.m34*b.m23 + a.m44*b.m24,
        a.m14*b.m31 + a.m24*b.m32 + a.m34*b.m33 + a.m44*b.m34,
        a.m14*b.m41 + a.m24*b.m42 + a.m34*b.m43 + a.m44*b.m44)

            elseif type(b) == 'table' and b._type == 'vec4' then
                return vec4(
        a.m11*b.x + a.m21*b.y + a.m31*b.z + a.m41*b.w,
        a.m12*b.x + a.m22*b.y + a.m32*b.z + a.m42*b.w,
        a.m13*b.x + a.m23*b.y + a.m33*b.z + a.m43*b.w,
        a.m14*b.x + a.m24*b.y + a.m34*b.z + a.m44*b.w)
            elseif type(b) == 'number' then
                return mat4(
        a.m11*b, a.m21*b, a.m31*b, a.m41*b,
        a.m12*b, a.m22*b, a.m32*b, a.m42*b,
        a.m13*b, a.m23*b, a.m33*b, a.m43*b,
        a.m14*b, a.m24*b, a.m34*b, a.m44*b)
            else
                error('Unsupported input in mat4 __mul')
            end
        end,
        __tostring = function(m) return string.format("[%4.1f %4.1f %4.1f %4.1f ]\n[%4.1f %4.1f %4.1f %4.1f ]\n[%4.1f %4.1f %4.1f %4.1f ]\n[%4.1f %4.1f %4.1f %4.1f ]",
                           m.m11, m.m21, m.m31, m.m41, m.m12, m.m22, m.m32, m.m42, m.m13, m.m23, m.m33, m.m43, m.m14, m.m24, m.m34, m.m44) end
    }) end,
})

local math = require 'math'
local sin, cos = math.sin, math.cos

local function rotate2(r)
  return mat2(cos(r), -sin(r),
              sin(r),  cos(r))
end
local function rotate3x(r)
  return mat3(1,     0,       0,
              0, cos(r), -sin(r),
              0, sin(r),  cos(r))
end
local function rotate3y(r)
  return mat3(cos(r), 0, sin(r),
                   0, 1,      0,
             -sin(r), 0, cos(r))
end
local function rotate3z(r)
  return mat3(cos(r), -sin(r), 0,
              sin(r),  cos(r), 0,
                   0,       0, 1)
end
local function rotate3(rx, ry, rz)
  return rotate3x(rx) * rotate3y(ry) * rotate3z(rz)
end
local function rotate4x(r)
  return mat4(1,     0,        0, 0,
              0, cos(r), -sin(r), 0,
              0, sin(r),  cos(r), 0,
              0,      0,       0, 1)
end
local function rotate4y(r)
  return mat4(cos(r), 0, sin(r), 0,
                   0, 1,      0, 0,
             -sin(r), 0, cos(r), 0,
                   0, 0,      0, 1)
end
local function rotate4z(r)
  return mat4(cos(r), -sin(r), 0, 0,
              sin(r),  cos(r), 0, 0,
                   0,       0, 1, 0,
                   0,       0, 0, 1)
end
local function rotate4(rx, ry, rz)
  return rotate4x(rx) * rotate4y(ry) * rotate4z(rz)
end

local M = {}
M.mat2 = mat2
M.mat3 = mat3
M.mat4 = mat4
M.mat  = mat4
M.rotate2  = rotate2
M.rotate3x = rotate3x
M.rotate3y = rotate3y
M.rotate3z = rotate3z
M.rotate3  = rotate3
M.rotate4x = rotate4x
M.rotate4y = rotate4y
M.rotate4z = rotate4z
M.rotate4  = rotate4
M.rotatex  = rotate4x
M.rotatey  = rotate4y
M.rotatez  = rotate4z
M.rotate   = rotate4

M.identity2 = mat2(1, 0,
                   0, 1)
M.identity3 = mat3(1, 0, 0,
                   0, 1, 0,
                   0, 0, 1)
M.identity4 = mat4(1, 0, 0, 0,
                   0, 1, 0, 0,
                   0, 0, 1, 0,
                   0, 0, 0, 1)
M.identity = M.identity4

M.scale = function ( sx, sy, sz )
    sy = sy or 1
    sz = sz or 1
    return mat4(sx, 0, 0, 0,
                0, sy, 0, 0,
                0,  0, sz, 0,
                0,  0, 0,  1)
end

M.translate = function (x, y, z)
  y = y or 0
  z = z or 0
  return mat4(1, 0, 0, x,
              0, 1, 0, y,
              0, 0, 1, z,
              0, 0, 0, 1)
end

function M.frustum(l, r, b, t, n, f)
  return mat4(2*n/(r-l),         0,  (r+l)/(r-l),            0,
                      0, 2*n/(t-b),  (t+b)/(t-b),            0,
                      0,         0, -(f+n)/(f-n), -2*n*f/(f-n),
                      0,         0,           -1,            0)
end
function M.perspective(fovy, aspect, n, f)
   local t = n * math.tan(fovy * math.pi / 360.0)
   local r = t * aspect
   return M.frustum(-r, r, -t, t, n, f)
end
function M.ortho(l, r, b, t, n, f)
  return mat4(2/(r-l),       0,        0, -(r+l)/(r-l),
                    0, 2/(t-b),        0, -(t+b)/(t-b),
                    0,       0, -2/(f-n), -(f+n)/(f-n),
                    0,       0,        0,            1)
end

function M.lookat( cameraPosition, cameraTarget, upVector)
  if type(cameraPosition) == 'table' and cameraPosition._type == 'vec3' and
     type(cameraTarget) == 'table' and cameraTarget._type == 'vec3' and
     type(upVector) == 'table' and upVector._type == 'vec3' then

    local f = Vec.normalize3(cameraTarget - cameraPosition)
    local s = Vec.normalize3(Vec.cross3(f, upVector))
    local u = Vec.cross3(s, f)

    return mat4(
          s.x, s.y,  s.z, -cameraPosition.x,
          u.x, u.y,  u.z, -cameraPosition.y,
        -f.x, -f.y, -f.z, -cameraPosition.z,
          0,   0,    0,   1)
  end
end

return M
