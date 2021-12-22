local function mt(...)
  local all = {}
  for _, v in pairs({...}) do
    for e, a in pairs(v) do
      all[e] = a
    end
  end
  return all
end

local n = mt({a="b"},{b="c"},{g="o"})
for key, value in pairs(n) do
  print(key, value)
end
