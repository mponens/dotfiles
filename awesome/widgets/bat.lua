local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local math = require('math')

local battery_module = {}
battery_module.battery = function()
	local levels = { "", "", "", "", "" }

	local battery_widget = wibox.widget {
		widget = wibox.widget.textbox
	}

	watch("acpi -i", 10,
		function(_widget, stdout)
			local battery_info = {}
			local capacities = {}
			for s in stdout:gmatch("[^\r\n]+") do
				-- Match a line with status and charge level
				local status, charge_str, _ = string.match(s, '.+: ([%a%s]+), (%d?%d?%d)%%,?(.*)')
				if status ~= nil then
					-- Enforce that for each entry in battery_info there is an
					-- entry in capacities of zero. If a battery has status
					-- "Unknown" then there is no capacity reported and we treat it
					-- as zero capactiy for later calculations.
					table.insert(battery_info, { status = status, charge = tonumber(charge_str) })
					table.insert(capacities, 0)
				end

				-- Match a line where capacity is reported
				local cap_str = string.match(s, '.+:.+last full capacity (%d+)')
				if cap_str ~= nil then
					capacities[#capacities] = tonumber(cap_str) or 0
				end
			end
			local capacity = 0
			local charge = 0
			local status
			for i, batt in ipairs(battery_info) do
				if capacities[i] ~= nil then
					if batt.charge >= charge then
						status = batt.status -- use most charged battery status
						-- this is arbitrary, and maybe another metric should be used
					end

					-- Adds up total (capacity-weighted) charge and total capacity.
					-- It effectively ignores batteries with status "Unknown" as we
					-- treat them with capacity zero.
					charge = charge + batt.charge * capacities[i]
					capacity = capacity + capacities[i]
				end
			end
			charge = charge / capacity
			local index = math.max(1, math.min(math.ceil(charge / 20), 5))
			battery_widget.text = string.format('%d%%.%s ', charge, levels[index])
		end,
		battery_widget
	)
	return battery_widget
end

return battery_module
