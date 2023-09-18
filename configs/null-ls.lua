local nullLS = require("null-ls")

local opts = {
  sources = {
    nullLS.builtins.diagnostics.mypy,   -- Python static type checker
    nullLS.builtins.diagnostics.ruff,   -- PYthon Linter
    nullLS.builtins.formatting.black    -- Python Auto Formatter
  }
}

return opts
