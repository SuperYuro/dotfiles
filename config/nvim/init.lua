require("SuperYuro.base")
require("SuperYuro.highlights")
require("SuperYuro.maps")
require("SuperYuro.plugins")

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_mac = has("SuperYuro.macunix")
local is_win = has("SuperYuro.win32")

if is_mac then
	require("SuperYuro.macos")
end
if is_win then
	require("SuperYuro.windows")
end
