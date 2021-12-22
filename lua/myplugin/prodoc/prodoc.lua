local vim,api = vim,vim.api
local prodoc = {}
local space = ' '
local _split = require('myplugin.prodoc.utils')._split

local prefix = function()
  local ft = vim.bo.filetype
  local has_lang,lang = pcall(require,'myplugin.prodoc.langs.'..ft)
  if not has_lang then
    error('Current filetype %s does not support')
    return
  end
  return lang.prefix
end

local prefix_with_doc = function(pf,params)
  local prefix_doc = {}
  local doc_summary = '@Summary '
  local doc_description = '@Description '
  local doc_param = '@Param '

  table.insert(prefix_doc,pf .. space .. doc_summary)
  table.insert(prefix_doc,pf .. space .. doc_description)
  for _,v in ipairs(params) do
    local p = pf .. space .. doc_param .. space .. v
    table.insert(prefix_doc,p)
  end

  return prefix_doc
end

function prodoc.generate_doc()
  local ft = vim.bo.filetype
  local comment_prefix = prefix()
  local lnum = api.nvim_win_get_cursor(0)[1]
  local line = vim.fn.getline('.')
  local params = require('myplugin.prodoc.langs.'..ft).get_params(lnum,line,_split)

  local doc = prefix_with_doc(comment_prefix,params)

  -- insert doc
  vim.fn.append(lnum-1,doc)
  -- set curosr
  vim.fn.cursor(lnum,#doc[1]+#comment_prefix+1)
  -- enter into insert mode
  api.nvim_command('startinsert!')
end

function prodoc.generate_command()
  api.nvim_command('command! -range -bar ProDoc lua require("prodoc").generate_doc()')
end

return prodoc
