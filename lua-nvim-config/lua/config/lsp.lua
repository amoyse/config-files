local luasnip = require('luasnip')
local cmp = require('cmp')

-- I don't know how it works, but the below will make <Tab> and <S-Tab> work for autocompletion stuff!!

cmp.setup({
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  completion = {
    completeopt = 'menu,menuone,noselect',
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    ["<C-y>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },

}
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if ok_cmp then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

local function on_attach(client, bufnr)
  -- Simple example keymaps. Add or tweak as you like.
  local map = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
  end

  map('n', 'gd', vim.lsp.buf.definition)
  map('n', 'K', vim.lsp.buf.hover)
  map('n', 'gr', vim.lsp.buf.references)
  map('n', '<leader>rn', vim.lsp.buf.rename)
  map('n', '<leader>ca', vim.lsp.buf.code_action)
end

-- Optional: use a single LspAttach autocmd instead of per-server on_attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    on_attach(client, bufnr)
  end,
})

-- -- Fix the presentation of errors
-- vim.diagnostic.config({
--   virtual_text = false
-- })
--
-- -- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


require('mason').setup({})
require('mason-lspconfig').setup({
  -- 1. Servers Mason should install for you
  ensure_installed = { 'lua_ls', 'pylsp', 'ltex', 'gopls', 'sqlls' },
})

-- Python (pylsp) – same settings you already had, just via vim.lsp.config
vim.lsp.config('pylsp', {
    filetypes = { 'python' },
    settings = {
        pylsp = {
            configurationSources = { 'flake8' },
            plugins = {
                jedi_completion = {
                    include_params = true,
                },
                jedi_signature_help = { enabled = true },
                jedi = {
                    extra_paths = {
                        '~/projects/work_odoo/odoo14',
                        '~/projects/work_odoo/odoo14',
                    },
                },
                pyflakes = { enabled = true },
                pylint = {
                    enabled = true,
                    debounce = 200,
                    args = { '--ignore=E501,E231,W293,W291,E303,E265,E226,E262,W391,E301,F405,E305,F401', '-' },
                },
                pylsp_mypy = { enabled = false },
                pycodestyle = {
                    enabled = true,
                    ignore = {
                        'E501', 'E231', 'W293', 'W291', 'E303',
                        'E265', 'E226', 'E262', 'W391', 'E301',
                        'F405', 'E305', 'F401',
                    },
                    maxLineLength = 120,
                },
                yapf = { enabled = true },
            },
        },
    },
})

-- LTeX – same settings as before
vim.lsp.config('ltex', {
    capabilities = capabilities,
    filetypes = { 'tex', 'bib', 'markdown', 'rst' },
    settings = {
        ltex = {
            language = 'en-GB',
            disabledRules = {
                ['en']    = { 'MORFOLOGIK_RULE_EN' },
                ['en-AU'] = { 'MORFOLOGIK_RULE_EN_AU' },
                ['en-CA'] = { 'MORFOLOGIK_RULE_EN_CA' },
                ['en-GB'] = {
                    'MORFOLOGIK_RULE_EN_GB',
                    'OXFORD_SPELLING_Z_NOT_S',
                    'MD_BASEFORM',
                    'SPIDERMAN',
                    'SUBJECT_MATTER',
                    'CYBER_COMPOUNDS',
                },
                ['en-NZ'] = { 'MORFOLOGIK_RULE_EN_NZ' },
                ['en-US'] = { 'MORFOLOGIK_RULE_EN_US' },
                ['en-ZA'] = { 'MORFOLOGIK_RULE_EN_ZA' },
                ['es']    = { 'MORFOLOGIK_RULE_ES' },
                ['it']    = { 'MORFOLOGIK_RULE_IT_IT' },
                ['de']    = { 'MORFOLOGIK_RULE_DE_DE' },
            },
        },
    },
})

vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})
