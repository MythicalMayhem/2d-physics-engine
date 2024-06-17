local bucket = {}
function bucket:magnitude(k, j)
    return math.sqrt(k * k + j * j)
end

function bucket:normalize2d(x, y)
    local m = bucket:magnitude(x, y)
    if m == 0 then
        return 0, 0
    else
        return (x / m), (y / m)
    end
end

function bucket.t2s(tbl)
    if tbl == nil then return '{}' end
    local result = ""
    for k, v in pairs(tbl) do
        if type(k) == "string" then result = result .. "[\"" .. k .. "\"]" .. "=" end
        if type(v) == "table" then result = result .. bucket.t2s(v)
        elseif type(v) == "boolean" then result = result .. tostring(v)
        else result = result .. "\"" .. v .. "\"" end
        result = result .. ","
    end
    if result ~= "" then result = result:sub(1, result:len() - 1) end
    return  "{"..result .. "}"
end

function bucket.concattabs(...)
    local a = {...} 
    local res = {}
 
    for i=1,#a do 
        for j=1,#(a[i]) do 
            res[#res +1 ] = a[i][j]
        end
    end
    return res
end


return bucket

