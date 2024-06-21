local bkt = require("libs/bucket")

local forces = {}
 
function forces:forceStep(pool)
    for ind, entity in ipairs(pool) do
        local i = 0
        if #entity.impulses == 0 then goto continue end
        while entity.impulses and (i < #entity.impulses) do
            i = i + 1
            local mag = entity.impulses[i].mag - entity.impulses[i].resistance
            if mag < 0 then table.remove(entity.impulses, i)
            else entity.impulses[i].mag = mag end
        end
        ::continue::
    end
    
end
function forces:applyImpulse(e,x,y,mag,resistance)
    local a = { x = x, y = y, mag = mag, resistance = resistance }
    table.insert(e.impulses, a)
end

function forces:LinearForce(e,x,y,mag,resistance)
    local a = { x = x, y = y, mag = mag, resistance = resistance }
    table.insert(e.linearforces, a)
end

return forces