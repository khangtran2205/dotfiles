return {
  'nvim-mini/mini.keymap',
  version = false,
  lazy = false,
  config = function()
    local mkey = require 'mini.keymap'

    mkey.setup()
    -- Navigate 'mini.completion' menu with `<Tab>` /  `<S-Tab>`
    mkey.map_multistep({ 'i', 's' }, '<Tab>', { 'pmenu_next', 'vimsnippet_next' })
    mkey.map_multistep({ 'i', 's' }, '<S-Tab>', { 'pmenu_prev', 'vimsnippet_prev' })
    -- On `<CR>` try to accept current completion item, fall back to accounting
    -- for pairs from 'mini.pairs'
    mkey.map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
    -- On `<BS>` just try to account for pairs from 'mini.pairs'
    mkey.map_multistep('i', '<BS>', { 'minipairs_bs' })
  end,
}
