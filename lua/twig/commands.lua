local Util = require("twig.util")
local M = {}

-- Query Taskwarrior for tasks with a project that matches the name of the current buffer.
---@param opts TwigOptions
M.TasksForBufferName = function(opts)
  local bufferFilename = Util.getBufferFilename()
  local matchPattern = bufferFilename:match(opts.project_pattern)

  if matchPattern == nil and not opts.fallback then
    print("Project pattern match failed for buffer.")
    return
  end

  local command = {
    "task",
    "project:" .. bufferFilename,
  }
  local result = vim.fn.system(command)
  print(table.concat(command, " ") .. "\n" .. result)
end

local commands = {
  TwigTasksForBuffer = { func = M.TasksForBufferName, opts = { desc = "List tasks associated with current buffer" } },
}

---@param plugin_opts TwigOptions
M.register = function(plugin_opts)
  for commandName, commandConfig in pairs(commands) do
    local func = function()
      commandConfig.func(plugin_opts)
    end
    vim.api.nvim_create_user_command(commandName, func, commandConfig.opts)
  end
end

return M
