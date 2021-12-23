local present, telescope = pcall(require, "telescope")
if not present then
  return print("Telescope not present!!!")
end
telescope.load_extension("projects")

telescope.setup {
  defaults = {
    prompt_prefix = "🔭 ",
    selection_caret = " ",
    path_display = {"smart"},
  },
  pickers = {},
  extensions = {
    project = {
      base_dirs = {
        "~/.config/nvim"
      },
      hidden_files = true -- default: false
    }
  }

}
