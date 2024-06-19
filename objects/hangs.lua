local hanger ={}
local molly = love 
hanger.hangers = {}
function hanger:new (x,y,r)
    local temp = {}
    temp.x = x
    temp.y = y~
    temp.r = r
    temp.area = ''
    temp.sprite = function() molly.graphics.circle('fill', temp.x, temp.y, temp.r) end
    table.insert(hanger.hangers,temp)    
    return temp
end

return hanger