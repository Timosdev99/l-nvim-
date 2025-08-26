return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    if not opts.sections then
      opts.sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      }
    end
    table.insert(opts.sections.lualine_c, {
      function()
        return vim.fn.WakaTimeToday()
      end,
    })
    return opts
  end,
}
