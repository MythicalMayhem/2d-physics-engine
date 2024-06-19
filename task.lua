 
local task = {}

local tasks= {}
local a =  {idle=1, running=2, done =3 }

function task:append(fun)
    local tab = {id = os.clock(), state=1, fun = fun}
    table.insert(tasks,tab)
    return tab.id
end

function task:pause(id)  tasks[id].state = 1 end
function task:run(id)    tasks[id].state = 2 end

function task:stop(id)   tasks[id].state = 3 end
function task:exists(id) return tasks[id]~= nil end


function task:mainLoop()
    local i = 1
    while i <= #tasks do
        if tasks[i].state == 2 then i = i + 1 tasks[i].fun()  end
        if tasks[i].state == 3 then tasks[i].fun() table.remove(tasks,i) end
    end
end


return task

