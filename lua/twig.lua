local Commands = require("twig.commands")
local Twig = {}

Twig.VERSION = "0.1.0" -- x-release-please-version

---@class TwigOptions
Twig.options = {
  project_pattern = ".+",
  fallback = true,
}

---@param opts? TwigOptions
Twig.setup = function(opts)
  Twig.options = vim.tbl_deep_extend("force", Twig.options, opts or {})
  Commands.register(Twig.options)
end

return Twig
