
-- FIFO, we push element from left, pop from right,
-- new element is at left, old element is at right
-- because redis has no reversely retrieve method on list
module(..., package.seeall)

local List = require 'lglib.list'
local rdlist = require 'bamboo.redis.list'
local db = BAMBOO_DB

function save( key, length, tbl )

end

function update( key, length, tbl )

end

function push( key, length, val )
	local len = db:llen(key)
	
	if len < length then
		db:lpush(key, val)
	else
		-- if FIFO is full, push this element from left, pop one old from right
		db:rpop(key)
		db:lpush(key, val)
	end
		
end

function pop( key )

	return rdlist.pop(key)
end

function remove( key, val )

	return rdlist.remove(key, val)
end

function retrieve( key )

	return rdlist.retrieve(key)
end

function len( key )

	return rdlist.len(key)
end

function del( key )
	
	return rdlist.del(key)
end

function have(key, obj)
	return rdlist.have(key, obj)
end

