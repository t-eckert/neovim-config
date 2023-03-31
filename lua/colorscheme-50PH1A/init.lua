local M = {}

local colors = {
	neutral_00 = "#FFFFFF",
	neutral_01 = "#FAFAFA",
	neutral_02 = "#F3F4F6",
	neutral_03 = "#D4D4D8",
	neutral_04 = "#a3a3a3",
	neutral_05 = "#737373",
	neutral_06 = "#525252",
	neutral_07 = "#262626",
	neutral_08 = "#18181B",
	neutral_09 = "#000000",
	red_light = "#ef4444",
	red_medium = "#dc2626",
	red_dark = "#b91c1c",
	yellow_light = "#fbbf24",
	yellow_medium = "#f59e0b",
	yellow_dark = "#d97706",
	green_light = "#34d399",
	green_medium = "#10b981",
	green_dark = "#059669",
	blue_light = "#7dd3fc",
	blue_medium = "#38bdf8",
	blue_dark = "#0284c7",
	purple_light = "#c084fc",
	purple_medium = "#a855f7",
	purple_dark = "#9333ea",
}

local c = colors

local theme = {
	Cursor = { fg = c.neutral_09, bg = c.neutral_05 },
	LineNr = { fg = c.neutral_04 },
	SignColumn = { fg = c.neutral_07, bg = c.neutral_09 },
	Function = { fg = c.blue_medium },
}

local function load()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "50PH1A"

	for group, hl in pairs(theme) do
		vim.api.nvim_set_hl(0, group, hl)
	end
end

function M.setup()
	load()
end

load()

return M
