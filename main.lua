local game = require('main/game')

local config = require('main.config')
local physics = require("physics/wrapper") 
local entities = require("objects/entity")
local tween = require('libs/tween')
 
local boxes = require("objects/box")

local wh = config.vh
local ww = config.vw

local c = {0.7, 0.7, 1}
boxes:new(true, 0, 0, ww, 10,c)
boxes:new(true, 0, 0, 10, wh,c) 
boxes:new(true, 0, wh - 10, ww, 10,c)
boxes:new(true, ww - 10, 0, 10, wh,c) 
boxes:new(true, 500, 900, 300, 50,c) 



game.player = entities:new() 

for i, entity in ipairs(entities.pool) do table.insert(entity.linearforces, { x = 0, y = 1, mag = config.gravity }) end
function game.keypressed(key)
    if key == 'space' then physics:applyImpulse(game.player,0,-1,12,config.resistance) end
    --if key == 'f' then tw:play() end
 end





 -- c = {0.2, 0.5, 0.5, 0.5}
-- M = boxes:new(false, 750, 850, 50,100,c)
-- tw = tween:new(M, { x = M.x, y = M.y }, { x = M.x + 20, y = M.y + 20 }, 1)