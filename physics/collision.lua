local funcs = {}



local function clipY(entity,box)
    if box.y > entity.y then   entity.y = box.y - (entity.h)    
    else  entity.y = box.y + (box.h)  end    
end

local function clipX(entity,box)
    if box.x > entity.x then  entity.x = box.x -  (entity.w)             
    else entity.x = box.x + (box.w)   end
end

function funcs:step(entity,boxes)
    local direction = entity.compute()  
    local toX = entity.x + direction.x*direction.mag
    local toY = entity.y + direction.y*direction.mag 
    local abs,ord = false,false
    local feetOn = nil
    for i, box in ipairs(boxes) do

        if (toX< box.x + box.w ) and (toX+ entity.w > box.x) and (entity.y < box.y + box.h) and (entity.y + entity.h > box.y )  then  
            abs =true  
            feetOn = box
        end    
        if (entity.x< box.x + box.w ) and (entity.x+ entity.w > box.x) and (toY < box.y + box.h) and (toY + entity.h > box.y )  then  
            ord =true 
            feetOn = box            
        end    
    end


    if feetOn then 
        if abs   then clipX(entity,feetOn)
        elseif ord   then clipY(entity,feetOn) end
    end
    if abs==false then entity.x = toX end
    if ord==false then entity.y = toY end  
end

function funcs:isInside(entity,box)
    local eright  = entity.x + entity.w
    local eleft = entity.x
    local etop  = entity.y 
    local ebot  = entity.y + entity.h

    local bright  = box.x + box.w
    local bleft   = box.x
    local btop    = box.y 
    local bbot    = box.y + box.h

    return (eright<=bright) and (eleft>=bleft) and (etop>=btop) and (bbot>=ebot)

end


return funcs