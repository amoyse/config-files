
vim.g.vimtex_view_method = 'zathura'
vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR>")

vim.g.vimtex_compiler_latexmk = {
  options = {
    "-shell-escape",
    "-interaction=nonstopmode",
    "-synctex=1",
  },
}

