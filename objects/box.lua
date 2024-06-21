
local boxes = {}
local molly = love 
boxes.colliders = {} 
boxes.areas = {} 

function boxes:new (canCollide,x,y,w,h)
    local temp = {}
    temp.x = x
    temp.y = y
    temp.h = h
    temp.w = w
    temp.sprite = function() molly.graphics.rectangle('fill', temp.x, temp.y, temp.w,temp.h) end
    if canCollide then
        table.insert(boxes.colliders,temp)    
    else
        table.insert(boxes.areas,temp)    
    end
    return temp
end
 
 

return boxes