local theme = require("lualine.themes.duskfox")

local black = "#000000"


theme.normal.a.fg = "#569fba"
theme.insert.a.fg = "#a3be8c"
theme.visual.a.fg = "#c4a7e7"
theme.terminal.a.fg = "#ea9a97"
theme.normal.a.bg = black
theme.insert.a.bg = black
theme.visual.a.bg = black
theme.terminal.a.bg = black

theme.normal.b.bg = black
theme.insert.b.bg = black
theme.visual.b.bg = black
theme.terminal.b.bg = black

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
