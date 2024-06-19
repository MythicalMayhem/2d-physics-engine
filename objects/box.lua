
local boxes = {}
local molly = love 
boxes.colliders = {} 
boxes.areas = {} 

function boxes:newCollider (x,y,w,h)
    local temp = {}
    temp.x = x
    temp.y = y
    temp.h = h
    temp.w = w
    temp.sprite = function() molly.graphics.rectangle('fill', temp.x, temp.y, temp.w,temp.h) end
    table.insert(boxes.colliders,temp)    
    return temp
end
 
function boxes:newArea (poi,x,y,w,h)
    local temp = {}
    temp.x = x
    temp.y = y
    temp.h = h
    temp.w = w
    temp.poi = poi --point of intrest
    temp.sprite = function() molly.graphics.rectangle('fill', temp.x, temp.y, temp.w,temp.h) end
    table.insert(boxes.areas,temp)    
    return temp
end
 

return boxes