local utils = {}

function utils.map(tbl, f)
  local t = {}
  for k,v in pairs(tbl) do
      t[k] = f(v)
  end
  return t
end

function utils.find(tbl, f)
  for _,v in pairs(tbl) do
    if(f(v)) then
      return v
    end
  end
  return nil
end

function utils.andd(val, f)
  if val ~= nil then
    f(val)
  end
end

return utils
