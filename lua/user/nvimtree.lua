local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    return
end

nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  --ignore_ft_on_setup = {
  --  "startify",
  --  "dashboard",
  --  "alpha",
  --},
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  --update_to_buf_dir = {
  --  enable = true,
  --  auto_open = true,
  --},
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    width = 30,
    side = "left",
    mappings = {
      list = {
        -- { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    --root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  --filters = {
  --  dotfiles = true,
  --},
})
