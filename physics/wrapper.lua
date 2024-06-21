local collisions = require('physics/collision')
local forces = require('physics/forces')

local entities = require("objects/entity")
local funs = {}

function funs:isInside (...) return collisions:isInside(...)  end
function funs:collisionStep (...) return collisions:collisionStep(...)  end

function funs:compute(...) return forces:compute(...) end
function funs:forceStep() return forces:forceStep(entities.pool) end
function funs:linearForce(...) return forces:linearForce(...) end
function funs:applyImpulse(...) return forces:applyImpulse(...) end

return funs