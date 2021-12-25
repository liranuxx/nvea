local function progress_callback(_,msg,info)
  local key = msg.token
  local val = msg.value
	local client_key = tostring(info.client_id)
  print(key,val,client_key)
end

vim.lsp.handlers["$/progress"] = function(...)
  local arg = select(4, ...)
  if type(arg) ~= 'number' then
  	progress_callback(...)
  else
  	progress_callback(
  		select(1, ...), -- err
  		select(3, ...), -- msg
  		{
  			client_id = select(4, ...)
  		}
  	)
  end
end


local a = vim.lsp.buf_get_clients()
print(vim.inspect(a))
