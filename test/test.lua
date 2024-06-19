local call = require('test2')

local p = 1000
for i = 1, 10, 1 do
    
    call:run(function()
        p = p -1
    end)
end

print(p)