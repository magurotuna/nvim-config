-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

vim.api.nvim_command('filetype plugin indent on')
vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.ruler = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = 'unnamedplus,unnamed'
vim.opt.termguicolors = true
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.showmatch = true
vim.opt.list = true
vim.opt.listchars = 'tab:▸-,trail:-,extends:»,precedes:«,nbsp:%'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.gdefault = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.showcmd = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.pumblend = 15
vim.opt.numberwidth = 5
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>')
vim.keymap.set('n', '<leader><leader>', '<C-^>', { noremap = true })
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', 'n', 'nzz', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true, silent = true })
vim.keymap.set('n', '*', '*zz', { noremap = true, silent = true })
vim.keymap.set('n', '#', '#zz', { noremap = true, silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { noremap = true, silent = true })
vim.keymap.set('', 'H', '^', { silent = true })
vim.keymap.set('', 'L', '$', { silent = true })
vim.keymap.set('n', 's', '<Nop>', { noremap = true })
vim.keymap.set('n', 'sj', '<C-w>j', { noremap = true })
vim.keymap.set('n', 'sk', '<C-w>k', { noremap = true })
vim.keymap.set('n', 'sl', '<C-w>l', { noremap = true })
vim.keymap.set('n', 'sh', '<C-w>h', { noremap = true })
vim.keymap.set('n', 'sJ', '<C-w>J', { noremap = true })
vim.keymap.set('n', 'sK', '<C-w>K', { noremap = true })
vim.keymap.set('n', 'sL', '<C-w>L', { noremap = true })
vim.keymap.set('n', 'sH', '<C-w>H', { noremap = true })
vim.keymap.set('n', 'ss', ':<C-u>sp<CR>', { noremap = true })
vim.keymap.set('n', 'sv', ':<C-u>vs<CR>', { noremap = true })
vim.keymap.set('n', 'sq', ':<C-u>q<CR>', { noremap = true })
vim.keymap.set('n', 'sQ', ':<C-u>bd<CR>', { noremap = true })
vim.keymap.set('n', 'st', ':<C-u>tabnew<CR>', { noremap = true })
vim.keymap.set('n', 'sn', 'gt', { noremap = true })
vim.keymap.set('n', 'sp', 'gT', { noremap = true })
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('c', '<C-d>', '<Del>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('c', '<C-n>', '<Down>', { noremap = true })
vim.keymap.set('c', '<C-p>', '<Up>', { noremap = true })
vim.keymap.set('c', '<M-b>', '<S-Left>', { noremap = true })
vim.keymap.set('c', '<M-f>', '<S-Right>', { noremap = true })

local lsp_keymap_opt = { noremap = true, silent = true }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lsp_keymap_opt)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, lsp_keymap_opt)
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, lsp_keymap_opt)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, lsp_keymap_opt)
vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, lsp_keymap_opt)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, lsp_keymap_opt)
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, lsp_keymap_opt)

require('lazy').setup({
  spec = {
    {
      "folke/tokyonight.nvim",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme tokyonight]])
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      cond = not vim.g.vscode,
    },
    { "neovim/nvim-lspconfig", cond = not vim.g.vscode },
    { "williamboman/mason.nvim", cond = not vim.g.vscode },
    { "williamboman/mason-lspconfig.nvim", cond = not vim.g.vscode },
    { "williamboman/mason-lspconfig.nvim", cond = not vim.g.vscode },
    {
      "nvim-telescope/telescope.nvim", tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" },
      cond = not vim.g.vscode,
    },
    { "lukas-reineke/lsp-format.nvim", cond = not vim.g.vscode },
    { "hrsh7th/nvim-cmp", cond = not vim.g.vscode },
    { "hrsh7th/cmp-nvim-lsp", cond = not vim.g.vscode },
    { "hrsh7th/cmp-buffer", cond = not vim.g.vscode },
    { "hrsh7th/cmp-path", cond = not vim.g.vscode },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = {
        { "kyazdani42/nvim-web-devicons" },
      },
      cond = not vim.g.vscode,
    },
    { "arkav/lualine-lsp-progress", cond = not vim.g.vscode },
    { "lukas-reineke/indent-blankline.nvim", cond = not vim.g.vscode },
    { "lambdalisue/fern.vim", cond = not vim.g.vscode },
    { "lewis6991/gitsigns.nvim", cond = not vim.g.vscode },
    { "dinhhuy258/git.nvim", cond = not vim.g.vscode },
  },
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

if vim.g.vscode then
    -- VSCode extension
else
  -- lualine
  require('lualine').setup {
    sections = {
      lualine_c = {
        { 'filename', path = 1 },
        'lsp_progress',
      },
    },
  }
  -- gitsigns
  require('gitsigns').setup()
  -- git.nvim
  require('git').setup {
    keymaps = {
      blame = '<leader>gb',
      browse = '<leader>go',
    },
  }
  -- indent-blankline.nvim
  require('ibl').setup()
  -- fern.vim
  vim.keymap.set('n', '<leader>n', ':<C-u>Fern . -reveal=%<CR>', { noremap = true, silent = true })
  vim.g['fern#disable_default_mappings'] = 1
  vim.g['fern#default_hidden'] = 1
  local fern_custom_id = vim.api.nvim_create_augroup('fern-custom', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    pattern =  'fern',
    callback = function ()
      vim.keymap.set('n', 'N', '<Plug>(fern-action-new-file)', { buffer = true })
      vim.keymap.set('n', 'K', '<Plug>(fern-action-new-dir)', { buffer = true })
      vim.keymap.set('n', 'c', '<Plug>(fern-action-copy)', { buffer = true })
      vim.keymap.set('n', 'm', '<Plug>(fern-action-move)', { buffer = true })
      vim.keymap.set('n', 'r', '<Plug>(fern-action-rename)', { buffer = true })
      vim.keymap.set('n', 'R', '<Plug>(fern-action-remove)', { buffer = true })
      vim.keymap.set('n', '<CR>', '<Plug>(fern-action-open-or-enter)', { buffer = true })
      vim.keymap.set('n', '-', '<Plug>(fern-action-mark:toggle)', { buffer = true })
      vim.keymap.set('v', '-', '<Plug>(fern-action-mark:toggle)', { buffer = true })
    end,
    group = fern_custom_id,
  })
  -- telescope
  local telescope_builtin = require('telescope.builtin')
  vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, {})
  vim.keymap.set('n', '<leader>s', telescope_builtin.live_grep, {})
  vim.keymap.set('n', '<leader>;', telescope_builtin.buffers, {})
  local actions = require('telescope.actions')
  local my_mappings = {
    ['<C-j>'] = {
      actions.move_selection_next,
      type = 'action',
      opts = { nowait = true, silent = true },
    },
    ['<C-k>'] = {
      actions.move_selection_previous,
      type = 'action',
      opts = { nowait = true, silent = true },
    },
    ['<C-[>'] = {
      actions.close,
      type = 'action',
      opts = { nowait = true, silent = true },
    },
  }
  require('telescope').setup {
    defaults = {
      layout_strategy = 'vertical',
      mappings = {
        i = my_mappings,
        n = my_mappings,
      },
    },
  }
  -- lsp-format
  require('lsp-format').setup()
  -- lsp
  local nvim_lsp = require('lspconfig')
  require('mason').setup()
  require('mason-lspconfig').setup {
    ensure_installed = {
      'lua_ls',
      'rust_analyzer',
      'clangd',
      'denols',
      'ts_ls',
      'zls',
    },
  }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lsp_keymap_opt)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, lsp_keymap_opt)
  vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, lsp_keymap_opt)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, lsp_keymap_opt)
  vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, lsp_keymap_opt)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, lsp_keymap_opt)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, lsp_keymap_opt)
  vim.keymap.set('n', 'gq', telescope_builtin.diagnostics, lsp_keymap_opt)
  local cmp = require('cmp')
  -- completion
  cmp.setup {
    mapping = {
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),
      ['C-['] = cmp.mapping.close(),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
      { name = "copilot" },
    }
  }

  -- treesitter
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      "typescript",
      "tsx",
      "go",
      "rust",
      "cpp",
      "yaml",
      "lua",
      "vimdoc",
      "vue",
      "json",
      "markdown",
    },
    highlight = {
      enable = true,
    },
  }
end
