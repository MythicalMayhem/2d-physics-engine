local molly = love
local bkt = require('libs/bucket')

local task = require('main/task')
local game = require('main/config')


local physics = require("physics/wrapper")

local cam = require("libs/cam")
local entities = require("objects/entity")

local boxes = require("objects/box")


local p = ''


function molly.load()
    molly.window.setMode(game.screenwidth, game.screenheight)
    molly.window.setFullscreen(false)
    molly.graphics.setFont(molly.graphics.newFont(25))

    local forcestId = task:append(function() physics:forceStep() end)
    task:run(forcestId) 


end


molly.camera = cam()
function molly.update(dt)
    task:mainLoop(dt)
    if molly.player==nil then return end
    if molly.keyboard.isDown('w', 'up') then molly.player.direction.y = -1
    elseif molly.keyboard.isDown('s', 'down') then molly.player.direction.y = 1
    else molly.player.direction.y = 0 end

    if molly.keyboard.isDown('a', 'left') then molly.player.direction.x = -1
    elseif molly.keyboard.isDown('d', 'right') then molly.player.direction.x = 1
    else molly.player.direction.x = 0 end
    physics:collisionStep(molly.player, boxes.colliders)
     
end




function molly.draw()

    molly.camera:attach() 
    
    for i, entity in ipairs(entities.pool) do molly.graphics.setColor(entity.c[1],entity.c[2],entity.c[3],entity.c[4] or 1 ) entity.sprite() end
    for i, box in ipairs(boxes.areas) do molly.graphics.setColor(box.c[1],box.c[2],box.c[3],box.c[4] or 1 ) box.sprite() end
    for i, box in ipairs(boxes.colliders) do molly.graphics.setColor(box.c[1],box.c[2],box.c[3],box.c[4] or 1 ) box.sprite() end
 
    molly.camera:detach()


end


return molly

-- local fps = 1
-- local debounce = os.clock()
-- if os.time() - debounce > 0.05 then
--     fps = 1 / dt
--     debounce = os.time()
-- end
-- molly.graphics.setColor(0.5, 0.9, 0.5)
-- molly.graphics.print('\n' .. tostring(p))
-- molly.graphics.print(tostring(fps) .. '\n')