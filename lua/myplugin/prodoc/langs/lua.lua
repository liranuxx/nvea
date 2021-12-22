local _split = require('myplugin.prodoc.utils')._split

local get_params = function(_,line)
  local params = {}
  local content = _split(line,'%((.*)%)')
  params = _split(content[1],'[^,%s]+')
  return params
end

return {
  prefix = '--',
  get_params = get_params
}
