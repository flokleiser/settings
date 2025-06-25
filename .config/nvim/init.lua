vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- vim.o.cmdheight = 1
-- vim.o.shortmess = vim.o.shortmess:gsub('F', '')

vim.opt.showcmd = false

vim.opt.more = true

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.cmd.cnoreabbrev("msg messages")

vim.g.mapleader = " "

vim.g.codedark_transparent = 1

vim.opt.statusline = "%f %h%m%r"
vim.opt.showmode = false

vim.opt.statusline = table.concat({
  "%f",       
  " %h%m%r", 
})


vim.cmd [[
	syntax on
	filetype plugin indent on

	hi Normal guibg=NONE ctermbg=NONE
	hi NonText guibg=NONE ctermbg=NONE
	hi SignColumn guibg=NONE ctermbg=NONE
	hi LineNr guibg=NONE ctermbg=NONE
	hi CursorLineNr guibg=NONE ctermbg=NONE
	hi EndOfBuffer guibg=NONE ctermbg=NONE
	hi FoldColumn guibg=NONE ctermbg=NONE
	hi ColorColumn guibg=NONE ctermbg=NONE
	hi CursorLine guibg=NONE ctermbg=NONE
	hi CursorColumn guibg=NONE ctermbg=NONE
	hi VertSplit guibg=NONE ctermbg=NONE
	hi Folded guibg=NONE ctermbg=NONE

	call plug#begin('~/.vim/plugged')

		Plug 'tomasiser/vim-code-dark'
		Plug 'tpope/vim-commentary'

		Plug 'folke/noice.nvim'
		Plug 'MunifTanjim/nui.nvim'

		Plug 'folke/snacks.nvim'
		Plug 'echasnovski/mini.nvim'
		Plug 'gbprod/cutlass.nvim'
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
		Plug 'nvim-neo-tree/neo-tree.nvim'

		Plug 'rcarriga/nvim-notify'

		Plug 'nvim-lualine/lualine.nvim'
		Plug 'nvim-tree/nvim-web-devicons'

		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

		Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
	
	call plug#end()

  	colorscheme codedark

]]


require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "tsx", "glsl" },
  highlight = { enable = true },
  auto_install = true,
}

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.frag", "*.vert", "*.glsl"},
  callback = function()
    vim.bo.filetype = "glsl"
  end,
})

vim.notify = require('notify')
require('notify').setup({
	timeout = 8000,
	background_colour = "#000000",
	level = vim.log.levels.ERROR, 
})

if not vim.g._noice_loaded then
	require("noice").setup({
	  lsp = {
		override = {
		  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
		  ["vim.lsp.util.stylize_markdown"] = true,
		},
	  },
	  presets = {
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	  },
	  routes = {
		{
		  view = "mini",
		  filter = { 
			event = "msg_show"
		  },
		  -- opts = { skip = true},
		},
	  },
	})
	vim.g._noice_loaded = true
end

local custom_codedark = require'lualine.themes.codedark'
custom_codedark.normal.c.bg = 'NONE'
custom_codedark.insert.c.bg = 'NONE'

custom_codedark.normal.b.bg = 'NONE'
custom_codedark.insert.b.bg = 'NONE'

require('mini.pairs').setup()
require("cutlass").setup()
require("telescope").setup()
require('lualine').setup({
	options = { 
		theme = custom_codedark,
		globalstatus = true,
	},
	sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},

        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'location'},
	  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.cmd("wincmd L")
  end,
})

vim.api.nvim_create_autocmd("CmdwinEnter", {
  callback = function()
    vim.keymap.set('n', '<Esc>', '<C-c> <C-c>', { buffer = true })
  end,
})

vim.keymap.set('n', '<C-H>', '<C-w>h', { desc = 'Go to left window' })
vim.keymap.set('n', '<C-L>', '<C-w>l', { desc = 'Go to right window' })
vim.keymap.set('n', '<C-K>', '<C-w>k', { desc = 'Go to top window' })
vim.keymap.set('n', '<C-J>', '<C-w>j', { desc = 'Go to bottom window' })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.api.nvim_set_hl(0, "StatusLine", 					{ bg = "NONE", fg = "#ffffff" })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })

vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", 			{ bg = "NONE", fg = "#ffffff" }) --seems to only affect the "/"
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", 		{ bg = "NONE", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NoiceCmdline", 					{ bg = "NONE", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", 				{ fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupInput", 		{ fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "NoicePopup",			 		{ fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "NoicePopupmenu",				{ fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "NoicePopupmenuBorder",			{ fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "NoicePopup",			 		{ fg = "#ffffff", bg = "NONE" })

vim.api.nvim_set_hl(0, "NoiceCmdlinePrompt", 			{ fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, 'MsgArea', 						{ fg = 'white', bg = "NONE" })
vim.api.nvim_set_hl(0, 'MsgSeparator', 					{ bg = "NONE"})
vim.api.nvim_set_hl(0, 'CmdLine', 						{ bg = "NONE"})

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlighting' })

vim.keymap.set("n", "J", "5j")
vim.keymap.set("n", "K", "5k")
vim.keymap.set("n", "L", "5l")
vim.keymap.set("n", "H", "5h")
vim.keymap.set("v", "J", "5j")
vim.keymap.set("v", "K", "5k")
vim.keymap.set("v", "L", "5l")
vim.keymap.set("v", "H", "5h")
vim.keymap.set("n", "<C-i>", "q:")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "~/.config/lf/lfrc",
  callback = function()
    vim.bo.filetype = "vim"
  end,
})

vim.keymap.set("n", "<leader>rr", function()
  vim.cmd("luafile $MYVIMRC")
  print("Config reloaded!")
end, { desc = "Reload Neovim config" })

if vim.env.TERM and vim.env.TERM:match("xterm") then
  vim.cmd([[
    let &t_EI = "\e[2 q"
    let &t_SI = "\e[5 q"
    autocmd VimEnter * silent !echo -ne "\e[2 q"
  ]])
end
