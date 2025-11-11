-- https://neovim.io/doc/user/options.html#option-summaryconfigvim


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
vim.opt.autoindent = true
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

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease updatetime to 200ms. Faster completion (4000ms default).
vim.opt.updatetime = 50 -- 250 in kickstart settings file

-- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 350

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable persistent undo history
vim.opt.undofile = true

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Set number column width to 4 {default 4}
-- vim.opt.numberwidth = 4

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable access to system clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Enable cursor line highlight
-- vim.opt.cursorline = true
vim.opt.cursorline = false

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
vim.opt.sidescrolloff = 5

-- Place a column line
-- vim.opt.colorcolumn = "80"

-- So that `` is visible in markdown files
vim.opt.conceallevel = 0

-- Defines how the jumplist works. Defaults to clean which will not reopen
-- closed buffers. Can set to stack or empty string so closed buffers are
-- reopened.
-- https://www.reddit.com/r/neovim/comments/1mlvrk4/vimojumpoptions_stack_is_underrated/
vim.opt.jumpoptions = ""

-- Autoload file changes
vim.opt.autoread = true

-- UTF-8 all the things
vim.opt.fileencoding = "utf-8"

-- Show current buffer name in title bar
vim.opt.title = true

-- Hides the mode indicator, eg -- INSERT --, already shown in status line
vim.opt.showmode = false

-- Creates a backup file
vim.opt.backup = false

-- `options` and `localoptions` will save keymaps among other things, which because a session
-- is loaded after the keymaps config, will override defined keymaps if the session has old
-- keymaps saved in it. `nvim -V1` in conjunction with `:verbose [mode]map` can be helpful in
-- diagnosing keymaps. The default sessionoptions should cover most things.
-- vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,options,localoptions"

-- Don't insert comment leader when hitting `o` or `O` from normal mode
-- (filetype specific settings might override these)
-- vim.opt.formatoptions:remove("o")
-- vim.o.formatoptions = "jcrql"
-- vim.cmd("set formatoptions-=o")

-- In insert mode, C-u will undo everything entered on current line, leaving you in insert mode.
-- This can be used as an alternative to adjusting the formatoptions. When a new line automatically
-- adds a comment, press C-u to undo it and carry on typing.

-- https://www.reddit.com/r/neovim/comments/1iofs0r/disable_o_r_formatoption_globally/
-- vim.api.nvim_create_autocmd("FileType", {
--     group = vim.api.nvim_create_augroup("user_formatoptions", { clear = true }),
--     pattern = "*",
--     callback = function()
--         -- We never want the following options
--         vim.opt_local.formatoptions:remove({
--             -- Auto-wrap text using 'textwidth'
--             "t",
--             -- Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
--             "c",
--             -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
--             "o",
--             -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
--             "r",
--         })
--     end,
-- })

-- Sets how Neovim will display certain whitespace in the editor
vim.opt.list = true
vim.opt.listchars = {
  -- tab = "» ",
  tab = "  ",
  trail = "·",
  nbsp = "␣",
}

-- Configure tab behaviour in commoand mode
vim.opt.wildmode = "longest:full,full"

vim.opt.spelllang = "en_nz,en_gb"

-- Better diff options than the default:
vim.opt.diffopt = "internal,filler,closeoff,linematch:60"
-- vim.opt.diffopt="filler,internal,closeoff,algorithm:histogram,context:5,linematch:60"
-- vim.opt.diffopt="internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"

-- https://neovim.io/doc/user/options.html#'winborder'
vim.opt.winborder = "single" -- bold, double, none, rounded, shadow, single, solid

vim.diagnostic.config({
  virtual_text = {
    prefix = "■ ", -- This square is the default, can be anything for eg "●", "▎", "x", "■", , 
  },

  virtual_lines = false,
  -- virtual_lines = { current_line = true },

  -- Uses vim.opt.winborder now unless overridden
  -- float = {
  --   border = "rounded",
  -- },
  signs = {
    -- text = {
    --   [vim.diagnostic.severity.ERROR] = '',
    --   [vim.diagnostic.severity.WARN] = '',
    --   [vim.diagnostic.severity.INFO] = '',
    --   [vim.diagnostic.severity.HINT] = '',
    -- },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
      [vim.diagnostic.severity.HINT] = 'DiagnosticHint',

    },
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
-- vim.opt.pumheight = 10					-- number of items in popup menu
-- vim.opt.pumblend = 10
-- vim.opt.showtabline = 2					-- always show the tab line
-- vim.opt.laststatus = 2					-- always show statusline
-- vim.opt.showcmd = true
-- vim.opt.cmdheight = 2  -- More space in the command line for displaying messages.

-- Consider - as part of keyword
-- opt.iskeyword:append("-")
