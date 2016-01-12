local vec2 
vec2 = setmetatable({}, {
    __call = function (t, x, y) return setmetatable({_type = 'vec2', x=x, y=y}, {
        __add = function(a, b) return vec2(a.x + b.x, a.y + b.y) end,
        __sub = function(a, b) return vec2(a.x - b.x, a.y - b.y) end,
        __mul = function(a, b)
            if type(b) == 'table' and b._type == 'vec2' then
                return vec2(a.x * b.x, a.y * b.y)
            elseif type(b) == 'number' then
                return vec2(a.x * b, a.y * b)
            else
                error('Unsupported input in vec2 __mul')
            end
        end,
        __div = function(a, b)
            if type(b) == 'table' and b._type == 'vec2' then
                return vec2(a.x / b.x, a.y / b.y)
            elseif type(b) == 'number' then
                return vec2(a.x / b, a.y / b)
            else
                error('Unsupported input in vec2 __div')
            end
        end,
        __tostring = function(v) return '<'..v.x..','..v.y..'>' end
    }) end,
})

local vec3 
vec3 = setmetatable({}, {
    __call = function (t, x, y, z) return setmetatable({_type = 'vec3', x=x, y=y, z=z}, {
        __add = function(a, b) return vec3(a.x + b.x, a.y + b.y, a.z + b.z) end,
        __sub = function(a, b) return vec3(a.x - b.x, a.y - b.y, a.z - b.z) end,
        __mul = function(a, b)
            if type(b) == 'table' and b._type == 'vec3' then
                return vec3(a.x * b.x, a.y * b.y, a.z * b.z)
            elseif type(b) == 'number' then
                return vec3(a.x * b, a.y * b, a.z * b)
            else
                error('Unsupported input in vec3 __mul')
            end
        end,
        __div = function(a, b)
            if type(b) == 'table' and b._type == 'vec3' then
                return vec3(a.x / b.x, a.y / b.y, a.z / b.z)
            elseif type(b) == 'number' then
                return vec3(a.x / b, a.y / b, a.z / b)
            else
                error('Unsupported input in vec3 __div')
            end
        end,
        __tostring = function(v) return '<'..v.x..','..v.y..','..v.z..'>' end
    }) end,
})

local vec4
vec4 = setmetatable({}, {
    __call = function (t, x, y, z, w) return setmetatable({_type = 'vec4', x=x, y=y, z=z, w=w}, {
        __add = function(a, b) return vec4(a.x + b.x, a.y + b.y, a.z + b.z, a.w + b.w) end,
        __sub = function(a, b) return vec4(a.x - b.x, a.y - b.y, a.z - b.z, a.w - b.w) end,
        __mul = function(a, b)
            if type(b) == 'table' and b._type == 'vec4' then
                return vec4(a.x * b.x, a.y * b.y, a.z * b.z, a.w * b.w)
            elseif type(b) == 'number' then
                return vec4(a.x * b, a.y * b, a.z * b, a.w * b)
            else
                error('Unsupported input in vec4 __mul')
            end
        end,
        __div = function(a, b)
            if type(b) == 'table' and b._type == 'vec4' then
                return vec4(a.x / b.x, a.y / b.y, a.z / b.z, a.w / b.w)
            elseif type(b) == 'number' then
                return vec4(a.x / b, a.y / b, a.z / b, a.w / b)
            else
                error('Unsupported input in vec4 __div')
            end
        end,
        __tostring = function(v) return '<'..v.x..','..v.y..','..v.z..','..v.w..'>' end
    }) end,
})

local function normalize3( v )
    if type(v) == 'table' and v._type == 'vec3' then
        local len = 1/math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z)
        return vec3(v.x * len, v.y * len, v.z * len)
    end
end

local function cross3( a, b )
    if type(a) == 'table' and a._type == 'vec3' and type(b) == 'table' and b._type == 'vec3' then
        return vec3(a.y*b.z - a.z*b.y, a.z*b.x - a.x*b.z, a.x*b.y - a.y*b.x)
    end
end

return {vec2 = vec2, vec3 = vec3, vec4 = vec4, vec = vec4, normalize3 = normalize3, cross3 = cross3}