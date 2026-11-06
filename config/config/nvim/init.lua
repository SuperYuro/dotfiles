vim.loader.enable()

-- Options and the leader key must be set before plugins are loaded
require("SuperYuro.base")
require("SuperYuro.maps")

-- Install and load plugins with vim.pack
-- Their setup lives in after/plugin/, which runs after every plugin is initialized
require("SuperYuro.pack")
