local game = require ("config")
local camera = {}
local molly = love
camera.__index = camera 

local init =  function (vw,vh)
    
    return setmetatable({
        vw = vw,
        vh = vh,
        x = 0,
        y = 0,
        rot = 0,
        zoom = 5,        
        _sx = 0,
        _sy = 0,
        _sw = 0,
        _sh = 0
    } , camera)
end

function camera:attach(x, y)
    self._sx,self._sy,self._sw,self._sh = molly.graphics.getScissor() 
    molly.graphics.setScissor(0,0,game.screenwidth,game.screenheight)
    molly.graphics.push()  
    molly.graphics.scale((game.screenwidth / game.vw)*self.zoom, (game.screenheight / game.vh)*self.zoom)   
    molly.graphics.translate(-x + game.vw/(2*self.zoom)   , -y + game.vh/(2*self.zoom))
    
end
function camera:detach()
    molly.graphics.pop()
    molly.graphics.setScissor(self._sx,self._sy,self._sw,self._sh)
    
end

return setmetatable(camera, {__call = function(_,a,b) return init(a,b) end})
