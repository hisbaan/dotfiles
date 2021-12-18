-- Force reload cache
require("plenary.reload").reload_module("florentc", true)

-- Load modules
require('plugins') -- lua/plugins.lua
require('autocmd') -- lua/autocmd.lua
require('mappings') -- lua/mappings.lua
require('options') -- lua/options.lua
