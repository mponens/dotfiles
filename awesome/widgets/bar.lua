local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gfs = require("gears.filesystem")
local dpi = require('beautiful').xresources.apply_dpi

local utils = require("widgets.utils")

local bar = {}

-- Takes a screen and adds a bar to it
bar.bar = function(s, taglist_buttons)
	local r_shape = utils.rrect(16)

	local mytaglist = awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons
	}
	local mywibox = awful.wibar({
		position = "top",
		screen = s,
		bg = "#00000000",
	})

	mywibox:setup {
		{
			{ -- Left widgets
				layout = wibox.layout.fixed.horizontal,
				{
					mytaglist,
					bg = "#0f6e6e",
					shape = r_shape,
					widget = wibox.container.background,
				}
			},
			{
				layout = wibox.layout.fixed.horizontal,
				{
					mytextclock,
					bg = "#663a00",
					shape = r_shape,
					widget = wibox.container.background,
				},
			},
			{ -- Right widgets
				layout = wibox.layout.fixed.horizontal,
				{
					mykeyboardlayout,
					wibox.widget.systray(),
					bg = "#0f6e6e",
					shape = r_shape,
					widget = wibox.container.background,
				},
			},
			layout = wibox.layout.align.horizontal,
			expand = "none",
		},
		widget = wibox.container.margin,
		left = 10,
		right = 10,
		top = 2,
		bottom = 0,
	}
	return mywibox
end

return bar
