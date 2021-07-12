---
-- This module adds fun.yield(n_iterations, n_seconds)
-- @module fun.yield
local fun = require 'fun'
local fiber = require 'fiber'

local methods = getmetatable(fun.iter{}).__index

local function tail_result(step, state_x, ...)
	if state_x == nil then
		return nil
	end
	return { step + 1, state_x }, ...
end

local function generator(param, state)
	local every, sleep, gen_x, param_x = param[1], param[2], param[3], param[4]
	local step, state_x = state[1], state[2]
	if step > 0 and step % every == 0 then
		fiber.sleep(sleep)
	end
	return tail_result(step, gen_x(param_x, state_x))
end

---
-- Yields iterator every `n_iterations` for `sleep` seconds
-- @param iterator required
-- @param n_iterations run fiber.sleep every `n_iterationz
-- @param[opt=0] sleep time to sleep in seconds
-- @return fun.iterator
function methods.yield(iterator, n_iterations, sleep)
	assert(n_iterations, "n_iterations for yield_every expected as #2 param")
	sleep = sleep or 0
	return fun.wrap(generator, { n_iterations, sleep, iterator.gen, iterator.param }, { 0, iterator.state })
end

methods.sleep = methods.yield

fun.sleep = methods.sleep
fun.yield = methods.yield

return fun.yield