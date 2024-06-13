local molly = love

local boxes = {}
local entity = {}
function entity:new()
    local temp = {}
    temp.x = 500
    temp.y = 500
    temp.h = 20
    temp.w = 20
    temp.stats = {speed = 3}
    temp.sprite = function()
        molly.graphics.rectangle('fill', temp.x, temp.y, 20,20)
    end
    return temp
end

function boxes:new (x,y,h,w)
    local temp = {}
    temp.x = x
    temp.y = y
    temp.h = h
    temp.w = w
    temp.sprite = function()
        molly.graphics.rectangle('fill', temp.x, temp.y, temp.h,temp.w)
    end
    return temp
end

local player = entity:new()

function molly.load()
    --molly.window.setMode(1600, 900)
    local box = boxes:new(200,300,35,35)
    table.insert(boxes,box)
    local box = boxes:new(350,200,35,35)
    table.insert(boxes,box)
    local box = boxes:new(600,100,35,35)
    table.insert(boxes,box)
 
end
local fps = 1
local debounce = os.clock()
local dirs = {abs=0, ord=0}
local p = ''
function collisions(abs,ord)
    local toX = player.x + (player.stats.speed)* abs
    local toY = player.y + (player.stats.speed)* ord

    for i, box in ipairs(boxes) do
        if (toX< box.x + box.w ) and (toX+ player.w > box.x)  and (toY < box.y + box.h) and (toY + player.h > box.y )then   return true end
    end

    return false
end



function molly.update(dt)
    local abs ,ord = 0,0
    if os.time() - debounce > 0.05 then     fps = 1 / dt     debounce = os.time() end
    if molly.keyboard.isDown('w','up') then ord = -1
    elseif molly.keyboard.isDown('s','down') then ord  = 1
    else ord =  0 end
    if molly.keyboard.isDown('a','left') then abs = -1
    elseif molly.keyboard.isDown('d','right') then abs =  1
    else abs = 0  end
    if collisions(abs , ord )==false then
        player.x = player.x + player.stats.speed*abs
        player.y = player.y + player.stats.speed*ord
    end

end

function molly.draw()
    molly.graphics.setColor(0.5, 0.9, 0.5)
    molly.graphics.print(tostring(fps)..tostring(dirs.abs)..'\n')
    molly.graphics.print('\n'..p)
    molly.graphics.setColor(0.5, 0.9, 0.5)
    player.sprite()
    molly.graphics.setColor(0.7, 0.7, 1)
    for i, box in ipairs(boxes) do box.sprite() end
end

 