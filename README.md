# twig.nvim

**twig.nvim** is a small and lightweight Taskwarrior integration plugin.

Twig is built to complement how I use my personal wiki alongside Taskwarrior for project management. In my workflow, every project rolls into a single file. This plugin provides a quick way to view all tasks associated with the current buffer/project. In short: `twig.md` = `task project:twig`.

## Requirements

- Neovim >= 0.8.0
- Taskwarrior

## Commands

- `TwigTasksForBuffer`: list tasks associate with the current buffer.

## Configuration

```lua
return {
  project_pattern = ".+",  -- an additional Lua match pattern to apply to the buffer name
  fallback = true,         -- if `project_pattern` does not match, fall back to the buffer name alone
}
```

Twig will apply the `project_pattern` to the current buffer name before querying Taskwarrior with Lua's `:match()` method. If that match returns `nil` and `fallback` is true, then the current buffer name will be used instead.
