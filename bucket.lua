local bucket = {}
function bucket:magnitude(k,j)
    return math.sqrt(k*k + j*j)
end

function bucket:normalize2d(x,y) 
    local m = bucket:magnitude(x,y)
    if m==0 then
        return 0,0 
    else
        return  (x/m),( y/m) 
    end 
end

function bucket.t2s(tbl)
    if tbl == {} then return '{}' end
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..bucket.t2s(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        else
            result = result.."\""..v.."\""
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end

return bucket
