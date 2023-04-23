local util = {}

---Gets the filename of the current buffer.
---@return string
util.getBufferFilename = function()
  local buffer_name = vim.api.nvim_buf_get_name(0)
  -- NOTE: these match expressions work, but they are not the best
  return buffer_name:match("^.+/(.+)$"):match("[^.]+")
end

return util
