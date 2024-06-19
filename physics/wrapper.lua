local collisions = require('physics/collision')

local funs = {}
funs.__index = funs 




return setmetatable(collisions,funs)