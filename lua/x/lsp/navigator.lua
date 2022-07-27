local keymaps = {
  { key = 'gr', func = require('navigator.reference').async_ref, desc = 'async_ref' },
  { key = '<Leader>gr', func = require('navigator.reference').reference, desc = 'reference' }, -- reference deprecated
  { mode = 'i', key = '<M-k>', func = vim.lsp.signature_help, desc = 'signature_help' },
  { key = '<c-k>', func = vim.lsp.buf.signature_help, desc = 'signature_help' },
  { key = 'g0', func = require('navigator.symbols').document_symbols, desc = 'document_symbols' },
  { key = 'gW', func = require('navigator.workspace').workspace_symbol_live, desc = 'workspace_symbol_live' },
  { key = '<c-]>', func = require('navigator.definition').definition, desc = 'definition' },
  { key = 'gd', func = require('navigator.definition').definition, desc = 'definition' },
  { key = 'gD', func = vim.lsp.buf.declaration, desc = 'declaration' },
  { key = 'gp', func = require('navigator.definition').definition_preview, desc = 'definition_preview' },
  { key = '<Leader><C-L>gt', func = require('navigator.treesitter').buf_ts, desc = 'buf_ts' },
  { key = '<Leader><C-L>gT', func = require('navigator.treesitter').bufs_ts, desc = 'bufs_ts' },
  { key = '<Leader><C-L>ct', func = require('navigator.ctags').ctags, desc = 'ctags' },
  { key = 'K', func = vim.lsp.buf.hover, desc = 'hover' },
  { key = '<Space>ca', mode = 'n', func = require('navigator.codeAction').code_action, desc = 'code_action' },
  {
    key = '<Space>ca',
    mode = 'v',
    func = require('navigator.codeAction').range_code_action,
    desc = 'range_code_action',
  },
  -- { key = '<Leader>re', func = 'rename()' },
  { key = '<Space>rn', func = require('navigator.rename').rename, desc = 'rename' },
  { key = '<Leader>gi', func = vim.lsp.buf.incoming_calls, desc = 'incoming_calls' },
  { key = '<Leader>go', func = vim.lsp.buf.outgoing_calls, desc = 'outgoing_calls' },
  { key = 'gi', func = vim.lsp.buf.implementation, desc = 'implementation' },
  { key = '<Space>D', func = vim.lsp.buf.type_definition, desc = 'type_definition' },
  { key = 'gL', func = require('navigator.diagnostics').show_diagnostics, desc = 'show_diagnostics' },
  { key = 'gG', func = require('navigator.diagnostics').show_buf_diagnostics, desc = 'show_buf_diagnostics' },
  { key = '<Leader>dt', func = require('navigator.diagnostics').toggle_diagnostics, desc = 'toggle_diagnostics' },
  { key = ']d', func = vim.diagnostic.goto_next, desc = 'next diagnostics' },
  { key = '[d', func = vim.diagnostic.goto_prev, desc = 'prev diagnostics' },
  { key = ']O', func = vim.diagnostic.set_loclist, desc = 'diagnostics set loclist' },
  { key = ']r', func = require('navigator.treesitter').goto_next_usage, desc = 'goto_next_usage' },
  { key = '[r', func = require('navigator.treesitter').goto_previous_usage, desc = 'goto_previous_usage' },
  { key = '<C-LeftMouse>', func = vim.lsp.buf.definition, desc = 'definition' },
  { key = 'g<LeftMouse>', func = vim.lsp.buf.implementation, desc = 'implementation' },
  { key = '<Leader><C-L>k', func = require('navigator.dochighlight').hi_symbol, desc = 'hi_symbol' },
  { key = '<Space><C-L>wa', func = require('navigator.workspace').add_workspace_folder, desc = 'add_workspace_folder' },
  {
    key = '<Space><C-L>wr',
    func = require('navigator.workspace').remove_workspace_folder,
    desc = 'remove_workspace_folder',
  },
  { key = '<Space><C-L>ff', func = vim.lsp.buf.format, mode = 'n', desc = 'format' },
  { key = '<Space><C-L>ff', func = vim.lsp.buf.range_formatting, mode = 'v', desc = 'range format' },
  { key = '<Space><C-L>rf', func = require('navigator.formatting').range_format, mode = 'n', desc = 'range_fmt_v' },
  { key = '<Space><C-L>wl', func = require('navigator.workspace').list_workspace_folders, desc = 'list_workspace_folders' },
  { key = '<Space><C-L>la', mode = 'n', func = require('navigator.codelens').run_action, desc = 'run code lens action' },
}

require 'navigator'.setup({
  debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log
  width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
  height = 0.3, -- max list window height, 0.3 by default
  preview_height = 0.35, -- max height of preview windows
  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
  -- 'shadow', or a list of chars which defines the border
  -- on_attach = function(client, bufnr)
  --   -- your hook
  -- end,
  -- put a on_attach of your own here, e.g
  -- function(client, bufnr)
  --   -- the on_attach will be called at end of navigator on_attach
  -- end,
  -- The attach code will apply to all LSP clients

  default_mapping = true, -- set to false if you will remap every key or if you using old version of nvim-
  keymaps = keymaps, -- a list of key maps
  -- this kepmap gK will override "gD" mapping function declaration()  in default kepmap
  -- please check mapping.lua for all keymaps
  treesitter_analysis = true, -- treesitter variable context
  treesitter_analysis_max_num = 100, -- how many items to run treesitter analysis
  -- this value prevent slow in large projects, e.g. found 100000 reference in a project
  transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it

  lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
  -- setup here. if it is nil, navigator will not init signature help
  signature_help_cfg = nil, -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help
  icons = {
    -- Code action
    code_action_icon = "🏏", -- note: need terminal support, for those not support unicode, might crash
    -- Diagnostics
    diagnostic_head = '🐛',
    diagnostic_head_severity_1 = "🈲",
    -- refer to lua/navigator.lua for more icons setups
  },
  lsp_installer = true, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
  lsp = {
    enable = true, -- skip lsp setup if disabled make sure add require('navigator.lspclient.mapping').setup() in you
    -- own on_attach
    code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    format_on_save = true, -- set to false to disable lsp code format on save (if you are using prettier/efm/formater etc)
    format_options = { async = false }, -- async: disable by default, the option used in vim.lsp.buf.format({async={true|false}, name = 'xxx'})
    disable_format_cap = { "sqls", "sumneko_lua", "gopls" }, -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
    disable_lsp = { 'pylsd', 'sqlls' }, -- a list of lsp server disabled for your project, e.g. denols and tsserver you may
    -- only want to enable one lsp server
    -- to disable all default config and use your own lsp setup set
    -- disable_lsp = 'all'
    -- Default {}
    diagnostic = {
      underline = true,
      virtual_text = true, -- show virtual for diagnostic message
      update_in_insert = false, -- update diagnostic message in insert mode
    },

    diagnostic_scrollbar_sign = { '▃', '▆', '█' }, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
    -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}
    diagnostic_virtual_text = true, -- show virtual for diagnostic message
    diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
    disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you  want to
    tsserver = {
      filetypes = { 'typescript' } -- disable javascript etc,
      -- set to {} to disable the lspclient for all filetypes
    },
    servers = { 'cmake', 'ltex' }, -- by default empty, and it should load all LSP clients avalible based on filetype
    -- but if you whant navigator load  e.g. `cmake` and `ltex` for you , you
    -- can put them in the `servers` list and navigator will auto load them.
    -- you could still specify the custom config  like this
    -- cmake = {filetypes = {'cmake', 'makefile'}, single_file_support = false},
    sumneko_lua = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    },
    pyright = { },
    remark_ls = { },
    sqlls = { },
    bashls = { },
    cssls = { },
    emmet_ls = { },
    svelte = { },
    tailwindcss = {},
    texlab = {},
    verible = {},
    vimls = {},
    yamlls = {},
  }
})

_ = {
  [[command!  -nargs=* Nctags lua require("navigator.ctags").ctags(<f-args>)]],
  "command! -nargs=0 LspLog lua require'navigator.lspclient.config'.open_lsp_log()",
  "command! -nargs=0 LspRestart lua require'navigator.lspclient.config'.reload_lsp()",
  "command! -nargs=0 LspToggleFmt lua require'navigator.lspclient.mapping'.toggle_lspformat()<CR>",
  "command! -nargs=0 LspKeymaps lua require'navigator.lspclient.mapping'.get_keymaps_help()<CR>",
  "command! -nargs=0 LspSymbols lua require'navigator.symbols'.side_panel()<CR>",
  "command! -nargs=0 TSymbols lua require'navigator.treesitter'.side_panel()<CR>",
  "command! -nargs=* Calltree lua require'navigator.hierarchy'.calltree(<f-args>)<CR>",
}
