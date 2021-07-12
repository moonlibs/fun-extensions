# fun extensions
Helpfull library which extends LuaFun iterator

## Install
luarocks install fun-extensions

## Inside
- fun.sleep, fun.yield: mapper which yields execution for `n` seconds after each `x` iterations:
```lua
require 'fun.yield'

fun.ones():take(8)
	:enumerate()
	:map(function(n)
		local r = {}
		for i = 1, n do
			r[i]=i
		end
		return os.time(), unpack(r)
	end)
	:yield(2, 1) -- sleep for 1 seconds every 2 iterations
	:each(print)

-- result:
-- 1626106181      1
-- 1626106181      1       2
-- 1626106182      1       2       3
-- 1626106182      1       2       3       4
-- 1626106183      1       2       3       4       5
-- 1626106183      1       2       3       4       5       6
-- 1626106184      1       2       3       4       5       6       7
-- 1626106184      1       2       3       4       5       6       7       8
```