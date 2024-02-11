-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/AlexMoyse/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/AlexMoyse/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/AlexMoyse/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/AlexMoyse/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/AlexMoyse/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  everforest = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["obsidian.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0D\0\1\0\19gf_passthrough\tutil\robsidian\frequireE\0\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0D\0\1\0\20toggle_checkbox\tutil\robsidian\frequire�\v\1\0\t\0@\0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2>\0004\3\3\0005\4\3\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\0055\6\t\0005\a\v\0005\b\n\0=\b\f\a5\b\r\0=\b\14\a5\b\15\0=\b\16\a=\a\17\0065\a\18\0=\a\19\0065\a\20\0=\a\21\0065\a\22\0=\a\23\0065\a\24\0=\a\25\0065\a\26\0=\a\27\0065\a\29\0005\b\28\0=\b\30\a5\b\31\0=\b \a5\b!\0=\b\"\a5\b#\0=\b$\a5\b%\0=\b&\a5\b'\0=\b(\a5\b)\0=\b*\a5\b+\0=\b,\a5\b-\0=\b.\a=\a/\6=\0060\0055\0066\0005\a2\0003\b1\0=\b3\a5\b4\0=\b5\a=\a7\0065\a9\0003\b8\0=\b3\a5\b:\0=\b5\a=\a;\6=\6<\5=\5=\4>\4\1\3=\3?\2B\0\2\1K\0\1\0\15workspaces\1\0\0\14overrides\rmappings\15<leader>ch\1\0\1\vbuffer\2\1\0\0\0\agf\1\0\0\topts\1\0\3\texpr\2\fnoremap\1\vbuffer\2\vaction\1\0\0\0\aui\14hl_groups\26ObsidianHighlightText\1\0\1\abg\f#75662e\16ObsidianTag\1\0\2\vitalic\2\afg\f#89ddff\24ObsidianExtLinkIcon\1\0\1\afg\f#c792ea\20ObsidianRefText\1\0\2\14underline\2\afg\f#c792ea\19ObsidianBullet\1\0\2\tbold\2\afg\f#89ddff\18ObsidianTilde\1\0\2\tbold\2\afg\f#ff5370\23ObsidianRightArrow\1\0\2\tbold\2\afg\f#f78c6c\17ObsidianDone\1\0\2\tbold\2\afg\f#89ddff\17ObsidianTodo\1\0\0\1\0\2\tbold\2\afg\f#f78c6c\ttags\1\0\1\rhl_group\16ObsidianTag\19highlight_text\1\0\1\rhl_group\26ObsidianHighlightText\19reference_text\1\0\1\rhl_group\20ObsidianRefText\23external_link_icon\1\0\2\rhl_group\24ObsidianExtLinkIcon\tchar\b\fbullets\1\0\2\rhl_group\19ObsidianBullet\tchar\6-\15checkboxes\6>\1\0\2\rhl_group\23ObsidianRightArrow\tchar\b\6x\1\0\2\rhl_group\17ObsidianDone\tchar\b\6 \1\0\0\1\0\2\rhl_group\17ObsidianTodo\tchar\b☐\1\0\2\venable\2\20update_debounce\3�\1\15completion\1\0\a\25preferred_link_style\twiki\23new_notes_location\17notes_subdir\14min_chars\3\2\rnvim_cmp\2\18use_path_only\1\22prepend_note_path\1\20prepend_note_id\2\16daily_notes\1\0\3\16date_format\15YYYY-mm-dd\rtemplate\19daily-template\vfolder$notes/journal-stuff/daily-pages\1\0\1\17notes_subdir\23notes/zettelkasten\1\0\2\tname\18alex-obsidian\tpathZ~/Users/AlexMoyse/Library/Mobile Documents/iCloud~md~obsidian/Documents/alex-obsidian\nsetup\robsidian\frequire\0" },
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19mappings_style\rsurround\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/surround.nvim",
    url = "https://github.com/ur4ltz/surround.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-terminal"] = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/vim-terminal",
    url = "https://github.com/tc50cal/vim-terminal"
  },
  vimtex = {
    loaded = true,
    path = "/Users/AlexMoyse/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19mappings_style\rsurround\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0D\0\1\0\19gf_passthrough\tutil\robsidian\frequireE\0\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0D\0\1\0\20toggle_checkbox\tutil\robsidian\frequire�\v\1\0\t\0@\0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2>\0004\3\3\0005\4\3\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\0055\6\t\0005\a\v\0005\b\n\0=\b\f\a5\b\r\0=\b\14\a5\b\15\0=\b\16\a=\a\17\0065\a\18\0=\a\19\0065\a\20\0=\a\21\0065\a\22\0=\a\23\0065\a\24\0=\a\25\0065\a\26\0=\a\27\0065\a\29\0005\b\28\0=\b\30\a5\b\31\0=\b \a5\b!\0=\b\"\a5\b#\0=\b$\a5\b%\0=\b&\a5\b'\0=\b(\a5\b)\0=\b*\a5\b+\0=\b,\a5\b-\0=\b.\a=\a/\6=\0060\0055\0066\0005\a2\0003\b1\0=\b3\a5\b4\0=\b5\a=\a7\0065\a9\0003\b8\0=\b3\a5\b:\0=\b5\a=\a;\6=\6<\5=\5=\4>\4\1\3=\3?\2B\0\2\1K\0\1\0\15workspaces\1\0\0\14overrides\rmappings\15<leader>ch\1\0\1\vbuffer\2\1\0\0\0\agf\1\0\0\topts\1\0\3\texpr\2\fnoremap\1\vbuffer\2\vaction\1\0\0\0\aui\14hl_groups\26ObsidianHighlightText\1\0\1\abg\f#75662e\16ObsidianTag\1\0\2\vitalic\2\afg\f#89ddff\24ObsidianExtLinkIcon\1\0\1\afg\f#c792ea\20ObsidianRefText\1\0\2\14underline\2\afg\f#c792ea\19ObsidianBullet\1\0\2\tbold\2\afg\f#89ddff\18ObsidianTilde\1\0\2\tbold\2\afg\f#ff5370\23ObsidianRightArrow\1\0\2\tbold\2\afg\f#f78c6c\17ObsidianDone\1\0\2\tbold\2\afg\f#89ddff\17ObsidianTodo\1\0\0\1\0\2\tbold\2\afg\f#f78c6c\ttags\1\0\1\rhl_group\16ObsidianTag\19highlight_text\1\0\1\rhl_group\26ObsidianHighlightText\19reference_text\1\0\1\rhl_group\20ObsidianRefText\23external_link_icon\1\0\2\rhl_group\24ObsidianExtLinkIcon\tchar\b\fbullets\1\0\2\rhl_group\19ObsidianBullet\tchar\6-\15checkboxes\6>\1\0\2\rhl_group\23ObsidianRightArrow\tchar\b\6x\1\0\2\rhl_group\17ObsidianDone\tchar\b\6 \1\0\0\1\0\2\rhl_group\17ObsidianTodo\tchar\b☐\1\0\2\venable\2\20update_debounce\3�\1\15completion\1\0\a\25preferred_link_style\twiki\23new_notes_location\17notes_subdir\14min_chars\3\2\rnvim_cmp\2\18use_path_only\1\22prepend_note_path\1\20prepend_note_id\2\16daily_notes\1\0\3\16date_format\15YYYY-mm-dd\rtemplate\19daily-template\vfolder$notes/journal-stuff/daily-pages\1\0\1\17notes_subdir\23notes/zettelkasten\1\0\2\tname\18alex-obsidian\tpathZ~/Users/AlexMoyse/Library/Mobile Documents/iCloud~md~obsidian/Documents/alex-obsidian\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
