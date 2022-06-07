
---Returns a function that calls the input function
---@param func function
---@param ... any
---@return function 
return function (func, ...)
	local args = ...
	return function()
		func(args)
	end
end