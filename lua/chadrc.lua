-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "kanagawa",
  transparency = false,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  header = {
    "  ▄▀  ████▄ ██▄       █    ▄█ ▄████  ▄███▄   ",
    "▄▀    █   █ █  █      █    ██ █▀   ▀ █▀   ▀  ",
    "█ ▀▄  █   █ █   █     █    ██ █▀▀    ██▄▄    ",
    "█   █ ▀████ █  █      ███▄ ▐█ █      █▄   ▄▀ ",
    " ███        ███▀          ▀ ▐  █     ▀███▀   ",
    "                                ▀            ",
    "",
    "🤔🤔🤔🤔💭💭💭💭",
    "",
    "🎯🎯DO HARD THINGS ‼️LOVE GOD AND MAN ‼️ BE INTENTIONAL🎯🎯",
    "",
    "",
  },
  load_on_startup = true,
}
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
