return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local icons = require 'mini.icons'
      local statusline = require 'mini.statusline'
      statusline.setup {
        use_icons = true,

        content = {
          active = function()
            local mode, mode_hl                  = MiniStatusline.section_mode({ trunc_width = 120 })
            -- local git           = MiniStatusline.section_git({ trunc_width = 40 })
            -- local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
            -- local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            -- local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
            local icon, icon_hl, icon_is_default = icons.get('filetype', vim.bo.filetype)
            local filename                       = '%f%m%r' -- MiniStatusline.section_filename({ trunc_width = 140 })
            -- local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })

            return MiniStatusline.combine_groups({
              { hl = mode_hl,                  strings = { string.upper(mode) } },
              -- { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { icon } },
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              -- { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              -- { hl = mode_hl,                  strings = { search, location } },
            })
          end,

          inactive = function()
            local filename = '%f%m%r'      -- MiniStatusline.section_filename({ trunc_width = 140 })

            return MiniStatusline.combine_groups({
              { hl = 'MiniStatuslineFilename', strings = { filename } },
            })
          end
        },
      }

      require('mini.notify').setup {}
      require('mini.pairs').setup {}
      require('mini.starter').setup {}
      require('mini.surround').setup {}
      require('mini.trailspace').setup {}
      require('mini.comment').setup {}
      require('mini.bufremove').setup {}

      require('mini.diff').setup {
        view = { style = 'sign' }
      }

      local gen_loader = require('mini.snippets').gen_loader
      require('mini.snippets').setup {
        gen_loader.from_lang(),
      }

      vim.keymap.set("n", "<space>go", ":lua MiniDiff.toggle_overlay()<cr>")
      vim.keymap.set("n", "<space>bd", ":lua MiniBufremove.delete()<cr>")
    end
  },
}
