return {
  "nvim-telescope/telescope-project.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local project_actions = require("telescope._extensions.project.actions")

    telescope.setup({
      extensions = {
        project = {
          base_dirs = {
            "~/Documents/repos/",
            "~/.config/",
            "~/",
          },
          ignore_missing_dirs = true,
          hidden_files = true,
          theme = "dropdown",
          order_by = "asc",
          sync_with_nvim_tree = true,
          on_project_selected = function(prompt_bufnr)
            project_actions.change_working_directory(prompt_bufnr, false)
          end,
        },
      },
    })

    telescope.load_extension("project")
  end,
}
