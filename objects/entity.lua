local bkt = require("libs/bucket")
local molly = love 

local entities = {}

entities.pool = {}


function entities:new() 
    local temp = {}
    temp.x = 500
    temp.y = 500
    temp.h = 20
    temp.w = 10
    temp.mass = 55
    temp.stats = { speed = 5 }
    temp.direction = { x = 0 , y = 0 ,mag = temp.stats.speed}
    temp.impulses = {}
    temp.linearforces   = {}
    temp.sprite = function() molly.graphics.rectangle('fill', temp.x, temp.y, temp.w,temp.h) end
    temp.compute = function()
        local sumx,sumy = 0,0
        local forces = bkt.concattabs(temp.linearforces,{{ x = temp.direction.x , y = 0 ,mag = temp.stats.speed}},temp.impulses)

        for i,force in ipairs(forces) do 
            local x,y = bkt:normalize2d(force.x,force.y)
            sumx = sumx + x*force.mag
            sumy = sumy + y*force.mag        
        end   

        local x,y = bkt:normalize2d(sumx,sumy)
        local summag = bkt:magnitude(sumx,sumy)

        return {x  =x, y   = y, mag = summag}
    end
    table.insert(entities.pool,temp)    
    return temp
end

return entities