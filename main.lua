local molly = love
local bkt = require('libs/bucket')

local task = require('task')
local tween = require('tween')
local game = require('config')

local cam = require("libs/cam")
local physics = require("physics/wrapper")

local entities = require("objects/entity")
local boxes = require("objects/box")

local fps = 1
local debounce = os.clock()
local p = ''
-- !the
-- * oj
-- ? huh
-- todo argh
-- the
-- //test
function molly.load()
    molly.window.setMode(game.screenwidth, game.screenheight)
    molly.window.setFullscreen(false)
    molly.graphics.setFont(molly.graphics.newFont(25))

    local wh = game.vh
    local ww = game.vw

    boxes:new(true, 0, wh - 10, ww, 10)
    boxes:new(true, 0, 0, ww, 10)
    boxes:new(true, ww - 10, 0, 10, wh)
    boxes:new(true, 0, 0, 10, wh) 
    boxes:new(true, 500, 900, 300, 50) 
    M = boxes:new(false, 750, 850, 50,100)

    tw = tween:new(M, { x = M.x, y = M.y }, { x = M.x + 20, y = M.y + 20 }, 1)
    local forcestId = task:append(function()
        for ind, entity in ipairs(entities.pool) do
            local i = 0
            if #entity.impulses == 0 then goto continue end
            while entity.impulses and (i < #entity.impulses) do
                i = i + 1
                local mag = entity.impulses[i].mag - entity.impulses[i].resistance
                if mag < 0 then
                    table.remove(entity.impulses, i)
                else
                    entity.impulses[i].mag = mag
                end
            end
            ::continue::
        end
    end)
    task:run(forcestId)


    for i, entity in ipairs(entities.pool) do table.insert(entity.linearforces, { x = 0, y = 1, mag = game.gravity }) end
end

local player = entities:new()
local camera = cam()


function molly.update(dt)
    if os.time() - debounce > 0.05 then
        fps = 1 / dt
        debounce = os.time()
    end

    p = bkt.t2s(task:mainLoop(dt)) 

    if molly.keyboard.isDown('w', 'up') then player.direction.y = -1
    elseif molly.keyboard.isDown('s', 'down') then player.direction.y = 1
    else player.direction.y = 0 end

    if molly.keyboard.isDown('a', 'left') then player.direction.x = -1
    elseif molly.keyboard.isDown('d', 'right') then player.direction.x = 1
    else player.direction.x = 0 end

    physics:step(player, boxes.colliders)
    --p =   physics:isInside(player,N)
end

function molly.draw()
    camera:attach(player.x, player.y)

    molly.graphics.setColor(0.5, 0.9, 0.5)
    player.sprite()

    molly.graphics.setColor(0.7, 0.7, 1)
    for i, box in ipairs(boxes.colliders) do box.sprite() end

    molly.graphics.setColor(0.2, 0.5, 0.5, 0.5)
    for i, area in ipairs(boxes.areas) do area.sprite() end



    camera:detach()

    molly.graphics.setColor(0.5, 0.9, 0.5)
    molly.graphics.print('\n' .. tostring(p))
    molly.graphics.print(tostring(fps) .. '\n')
end

function molly.keypressed(key)
    if key == 'space' then
        local a = { x = 0, y = -1, mag = 12, resistance = game.resistance }
        table.insert(player.impulses, a)
    end
    if key == 'f' then
        tw:play()
    end
end
