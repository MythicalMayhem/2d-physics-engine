 
local task = {}


task.tasks= {}
local bookshelf = {}


local a =  {idle=1, running=2, done =3 }
local k  = 1
function task:append(func)
    local id = k
    k = k + 1
    
    local tab = { state=1, fun = func}

    table.insert(bookshelf, id)
    task.tasks[id] = tab

    return id
end

function task:pause(id)   task.tasks[id].state = 1 end
function task:run(id)     task.tasks[id].state = 2 end
function task:kill(id)   task.tasks[id].state = 3 end 

function task:exists(id) return task.tasks[id]~= nil end

function task:mainLoop(dt)
    local i = 1
    while i <= #bookshelf do
        local temp = task.tasks[ bookshelf[i]  ]
        if temp.state == 1 then i = i + 1  
        elseif temp.state == 2 then i = i + 1 temp.fun(dt)   
        elseif temp.state == 3 then task.tasks[ bookshelf[i] ]=nil table.remove(bookshelf,i) end
    end
    return bookshelf
end


return task

