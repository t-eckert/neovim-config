local theme = require("lualine.themes.terafox")

local black = "#000000"

theme.normal.c.bg = black
theme.insert.c.bg = black
theme.visual.c.bg = black
theme.normal.b.bg = black
theme.insert.b.bg = black
theme.visual.b.bg = black

require("lualine").setup(
	{
		options = {
			theme = theme,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
		}
	}
)
