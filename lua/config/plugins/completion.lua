return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = "*",
    opts = {
      keymap = { preset = 'default' },

      completion = {
        menu = {
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", gap = 1, "kind" }
            },
          },
        },
      },

      signature = { enabled = false }
    },
  },
}
