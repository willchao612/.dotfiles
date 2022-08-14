local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then return end

local Rule = require "nvim-autopairs.rule"
local cond = require "nvim-autopairs.conds"

autopairs.setup {}
autopairs.add_rules {
  Rule("*", "*", "markdown"):with_pair(cond.not_before_regex("^%s*$", -1)),
  Rule("_", "_", "markdown"),
}
