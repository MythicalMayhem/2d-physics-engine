local tws = {}
local task = require ('task')


function tws:new(e,from,to,ms)
    local x = from.x
    local y = from.y

    local tox = to.x
    local toy = to.y

    local d = math.sqrt((x -tox)^2 + (y-toy)^2)    

    local speedx = (x -tox)/ms
    local speedy = (y -toy)/ms
 
    local temp = {}
    temp.state = 1 --idle running ended 
    temp.id = task:append(function()
        e.x = e.x +speedx
        e.y = e.y +speedy
        if math.abs(e.x-tox) < 0.1 then return false else return true end        
    end)
    
    function temp:play()    task:run(temp.id)   end
    function temp:stop()    task:stop(temp.id)  end
    function temp:pause()   task:pause(temp.id) end 
    function temp:destroy() task:stop() temp=nil end 

    return temp
end

return tws