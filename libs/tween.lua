local tws = {}
local task = require ('main/task')


function tws:new(e,from,to,seconds)
    local x = from.x
    local y = from.y

    local tox = to.x
    local toy = to.y


    local speedx = (tox-x)/seconds
    local speedy = (toy-y)/seconds

    local temp = {}
    temp.state = 1 --idle running ended 
    temp.id = task:append(function(dt)
        if temp.state == (3 or 1) then return end
        e.x = e.x +speedx*dt
        e.y = e.y +speedy*dt
        if math.abs(e.x-tox) < 0.1 then e.x=tox e.y = toy temp.state = 3 end

    end)

    function temp:play()    e.x = from.x e.y = from.y temp.state = 1 task:run(temp.id)   end
    function temp:pause()   task:pause(temp.id) end
    function temp:resume()  task:run(temp.id)   end
    function temp:destroy() task:kill(temp.id) temp=nil end
 
    return temp
end

return tws