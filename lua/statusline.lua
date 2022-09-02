local my_iceburg = require("lualine.themes.iceberg_dark")

my_iceburg.normal.c.bg = "#050505"

require("lualine").setup(
	{
		options = {
			theme = my_iceburg,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
		}
	}
)
