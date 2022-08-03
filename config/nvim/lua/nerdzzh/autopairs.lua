require("nvim-autopairs").setup {}
local Rule = require "nvim-autopairs.rule"
local cond = require "nvim-autopairs.conds"
require("nvim-autopairs").add_rules {
  Rule("*", "*", "markdown"):with_pair(cond.not_before_regex("^%s*$", -1)),
}
