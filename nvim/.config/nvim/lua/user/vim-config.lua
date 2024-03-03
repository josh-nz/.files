-- https://neovim.io/doc/user/options.html#option-summary


-- Make sure to set `mapleader` before lazy
-- plugin manager init so your mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 2

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Show %s text substitution results in a split window
vim.opt.inccommand = "split"

-- Disable text wrap
vim.opt.wrap = false

-- Allow movement past end of line in visual block mode
vim.opt.virtualedit = "block"

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease updatetime to 200ms. Faster completion (4000ms default).
vim.opt.updatetime = 50

-- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 500

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable persistent undo history
vim.opt.undofile = true

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Set number column width to 4 {default 4}
-- vim.opt.numberwidth = 4

-- Enable access to System Clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Always keep 8 lines above/below cursor unless at start/end of file
-- https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
vim.opt.scrolloff = 8 -- 999
vim.opt.sidescrolloff = 8

-- Place a column line
-- vim.opt.colorcolumn = "80"

-- So that `` is visible in markdown files
vim.opt.conceallevel = 0

-- Autoload file changes
vim.opt.autoread = true

-- UTF-8 all the things
vim.opt.fileencoding = "utf-8"

-- Show current buffer name in title bar
vim.opt.title = true

-- Creates a backup file
vim.opt.backup = false

-- Recommended settings for auto-session plugin
-- https://github.com/rmagatti/auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"


vim.diagnostic.config({
  float = {
    border = 'rounded',
  },
})


-- Other stuff
-- vim.opt.shiftround = true
-- vim.opt.backspace = '2'
-- vim.opt.autowrite = true
-- vim.cmd('set path+=**')					-- search current directory recursively
-- vim.opt.syntax = "ON"
-- vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- vim.opt.swapfile = false -- creates a swapfile
-- vim.opt.compatible = false				-- turn off vi compatibility mode
-- vim.opt.pumheight = 10					-- number of items in popup menu
-- vim.opt.pumblend = 10
-- vim.opt.showmode = false -- hides the mode indicator, eg -- INSERT --
-- vim.opt.showtabline = 2					-- always show the tab line
-- vim.opt.laststatus = 2					-- always show statusline
-- vim.opt.showcmd = true
-- vim.opt.cmdheight = 2  -- More space in the command line for displaying messages.
-- vim.opt.showmode = true
-- vim.opt.guifont = "monospace:h17"		
-- vim.cmd('filetype plugin on')			-- set filetype
-- vim.cmd('set wildmenu')					-- enable wildmen
-- vim.opt.ruler = false

-- vim.g.netrw_banner = 0					-- gets rid of the banner for netrw
-- vim.g.netrw_browse_split=4				-- open in prior window
-- vim.g.netrw_altv = 1					-- change from left splitting to right splitting
-- vim.g.netrw_liststyle=3					-- tree style view in netrw
