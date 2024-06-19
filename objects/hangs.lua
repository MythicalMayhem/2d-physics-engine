local hanger ={}
local molly = love 
hanger.hangs = {}
function hanger:new (area ,x,y,r)
    local temp = {}
    temp.x = x
    temp.y = y
    temp.r = r
    temp.area = area 
    temp.sprite = function() molly.graphics.circle('fill', temp.x, temp.y, temp.r) end
    table.insert(hanger.hangs,temp)    
    return temp
end

return hanger