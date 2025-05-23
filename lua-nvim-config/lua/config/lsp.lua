local lsp = require('lsp-zero').preset({})
local luasnip = require('luasnip')
local cmp = require('cmp')

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)


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
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    -- ["<CR>"] = cmp.mapping.confirm({
    --     behavior = cmp.ConfirmBehavior.Replace,
    --     select = true,
    --   }),
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
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').sqlls.setup{}



require('lspconfig').pylsp.setup {
    filetypes = {'python'},
    settings = {
        configurationSources = {"flake8"},
        formatCommand = {"black"},
        pylsp = {
            plugins = {
                -- jedi_completion = {fuzzy = true},
                -- jedi_completion = {eager=true},
                jedi_completion = {
                    include_params = true,
                },
                jedi_signature_help = {enabled = true},
                jedi = {
                    extra_paths = {'~/projects/work_odoo/odoo14', '~/projects/work_odoo/odoo14'},
                    -- environment = {"odoo"},
                },
                pyflakes={enabled=true},
                pylint = {args = {'--ignore=E501,E231,W293,W291,E303,E265,E226,E262,W391,E301,F405,E305,F401', '-'}, enabled=true, debounce=200},
                pylsp_mypy={enabled=false},
                pycodestyle={
                    enabled=true,
                    ignore={'E501', 'E231', 'W293', 'W291', 'E303', 'E265', 'E226', 'E262', 'W391', 'E301', 'F405', 'E305', 'F401' },
                    maxLineLength=120},
                    yapf={enabled=true}
                }
            }
        }
    }



require('lspconfig').ltex.setup {
  settings = {
    ltex = {
      language = "en-GB",
      disabledRules = {
          ["en"]    = { "MORFOLOGIK_RULE_EN"    },
          ["en-AU"] = { "MORFOLOGIK_RULE_EN_AU" },
          ["en-CA"] = { "MORFOLOGIK_RULE_EN_CA" },
          ["en-GB"] = { "MORFOLOGIK_RULE_EN_GB", "OXFORD_SPELLING_Z_NOT_S" },
          ["en-NZ"] = { "MORFOLOGIK_RULE_EN_NZ" },
          ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
          ["en-ZA"] = { "MORFOLOGIK_RULE_EN_ZA" },
          ["es"]    = { "MORFOLOGIK_RULE_ES"    },
          ["it"]    = { "MORFOLOGIK_RULE_IT_IT" },
          ["de"]    = { "MORFOLOGIK_RULE_DE_DE" },
      },
    }
  }
}


lsp.setup()
