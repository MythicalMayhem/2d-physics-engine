local game = {}
game.gravity = 9.8
game.resistance = 0.128
game.vw = 1920
game.vh = 1080

local coef = 1
game.screenwidth  = (game.vw/coef)
game.screenheight = (game.vh/coef)


return game 