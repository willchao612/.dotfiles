vim.g.mapleader = ","
vim.g.maplocalleader = ";"

require "nerdzzh.disable_builtin"

if require "nerdzzh.first_load"() then return end

require "plugins"
