local gears = require("gears")

local utils = {}

utils.rrect = function(radius)
	local f = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, radius)
	end
	return f
end

return utils
