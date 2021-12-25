local present, telescope = pcall(require, "telescope")
if not present then
  return print("Telescope not present!!!")
end
telescope.load_extension("projects")

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
    },
    prompt_prefix = "🔭 ",
    selection_caret = " ",
    path_display = {"smart"},
  },
  pickers = { },
  extensions = {
    project = {
      base_dirs = {
        "~/.config/nvim"
      },
      hidden_files = true -- default: false
    }
  }

}
