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

vim.cmd([[packadd packer.nvim]])

require('packer').startup(function (use)
  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- lsp
  use 'neovim/nvim-lspconfig'

  -- language server management
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- wrapper to easily integrate "format-on-save" feature
  use "lukas-reineke/lsp-format.nvim"

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- colorscheme
  use 'EdenEast/nightfox.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'sho-87/kanagawa-paper.nvim'

  use 'xiyaowong/nvim-transparent'

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'arkav/lualine-lsp-progress'

  use {
    'andymass/vim-matchup',
    setup = function ()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }

  use 'lukas-reineke/indent-blankline.nvim'

  use 'windwp/nvim-ts-autotag'

  use 'lambdalisue/fern.vim'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'

  -- Make quickfix window better
  use {
    'kevinhwang91/nvim-bqf',
    ft = 'qf'
  }
end)

vim.cmd('colorscheme kanagawa-paper')
require('transparent').setup()

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

-- highlight yanked region
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 500 }')

require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  }
})

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
    'tsserver',
    'zls',
  },
}
local lsp_keymap_opt = { noremap = true, silent = true }

-- Some telescope functions are disabled because there is an issue with Deno LSP
-- https://github.com/nvim-telescope/telescope.nvim/issues/2768
-- vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, lsp_keymap_opt)
-- vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, lsp_keymap_opt)
-- vim.keymap.set('n', 'gy', telescope_builtin.lsp_type_definitions, lsp_keymap_opt)
-- vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, lsp_keymap_opt)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lsp_keymap_opt)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, lsp_keymap_opt)
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, lsp_keymap_opt)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, lsp_keymap_opt)
vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, lsp_keymap_opt)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, lsp_keymap_opt)
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, lsp_keymap_opt)
vim.keymap.set('n', 'gq', telescope_builtin.diagnostics, lsp_keymap_opt)
require('mason-lspconfig').setup_handlers {
  function (server_name)
    local lsp_opt = {
      on_attach = function (client, bufnr)
        -- if the language server supports formatting, it is invoked on save
        require('lsp-format').on_attach(client)

        -- Do something more
      end,
      capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      ),
    }

    local node_root_dir = nvim_lsp.util.root_pattern('package.json', 'tsconfig.json', 'node_modules')
    local is_node_repo = node_root_dir(vim.fn.getcwd()) ~= nil
    local deno_root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.jsonc', 'import_map.json')
    local is_deno_repo = deno_root_dir(vim.fn.getcwd()) ~= nil

    if server_name == 'tsserver' then
      if is_node_repo then
        lsp_opt.root_dir = node_root_dir
      else
        return
      end
    end

    if server_name == 'denols' then
      if is_deno_repo then
        lsp_opt.root_dir = deno_root_dir
        lsp_opt.init_options = {
          enable = true,
          lint = true,
          unstable = true,
        }
      else
        return
      end
    end

    nvim_lsp[server_name].setup(lsp_opt)
  end,

  ['lua_ls'] = function ()
    nvim_lsp.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }
  end
}

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
  }
}
