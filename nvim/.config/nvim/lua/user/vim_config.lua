-- https://neovim.io/doc/user/oions.html#option-summaryconfigvim


-- Make sure to set `mapleader` before lazy
-- plugin manager init so your mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Enable relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Set tabs to 2 spaces
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Enable auto indenting and set it to spaces
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.shiftwidth = 2

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.o.breakindent = true

-- Enable incremental searching
vim.o.incsearch = true
vim.o.hlsearch = true

-- Show %s text substitution results in a split window
vim.o.inccommand = "split"

-- Disable text wrap
vim.o.wrap = false

-- Allow movement past end of line in visual block mode
vim.o.virtualedit = "block"

-- Better splitting
vim.o.splitbelow = true
vim.o.splitright = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease updatetime to 200ms. Faster completion (4000ms default).
vim.o.updatetime = 50 -- 250 in kickstart settings file

-- Time to wait for a mapped sequence to complete (in milliseconds)
vim.o.timeoutlen = 350

-- Set completeo to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Enable persistent undo history
vim.o.undofile = true

-- Enable 24-bit color. Also uses the `gui` highlight attributes
-- in colorschemes instead of the `cterm` attributes.
vim.o.termguicolors = true

-- This is the Neovim default except I have set a highlight group of `Cursor`
-- for some modes. This means that if a colorscheme sets this highlight then
-- the cursor will adapt accordingly. Without setting the highlight group the
-- default terminal cursor color is used.
vim.o.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor,t:block-blinkon500-blinkoff500-TermCursor"

-- Set number column width to 4 {default 4}
-- vim.o.numberwidth = 4

-- Enable the sign column to prevent the screen from jumping
vim.o.signcolumn = "yes"

-- Enable access to system clipboard
vim.o.clipboard = "unnamed,unnamedplus"

-- Enable cursor line highlight
-- vim.o.cursorline = true
vim.o.cursorline = false

-- Set fold settings
-- These oions were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Always keep 8 lines above/below cursor unless at start/end of file
-- https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
vim.o.scrolloff = 8 -- 999
vim.o.sidescrolloff = 5

-- Place a column line
-- vim.o.colorcolumn = "80"

-- So that `` is visible in markdown files
vim.o.conceallevel = 0

-- Defines how the jumplist works. Defaults to clean which will not reopen
-- closed buffers. Can set to stack or empty string so closed buffers are
-- reopened.
-- https://www.reddit.com/r/neovim/comments/1mlvrk4/vimojumpoions_stack_is_underrated/
vim.o.jumpoptions = ""

-- Autoload file changes
vim.o.autoread = true

-- UTF-8 all the things
vim.o.fileencoding = "utf-8"

-- Show current buffer name in title bar
vim.o.title = true

-- Hides the mode indicator, eg -- INSERT --, already shown in status line
vim.o.showmode = false

-- Creates a backup file
vim.o.backup = false

-- `oions` and `localoptions` will save keymaps among other things, which because a session
-- is loaded after the keymaps config, will override defined keymaps if the session has old
-- keymaps saved in it. `nvim -V1` in conjunction with `:verbose [mode]map` can be helpful in
-- diagnosing keymaps. The default sessionoions should cover most things.
-- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,options,localoptions"

-- Don't insert comment leader when hitting `o` or `O` from normal mode
-- (filetype specific settings might override these)
-- vim.o.formatoptions:remove("o")
-- vim.o.formatoions = "jcrql"
-- vim.cmd("set formatoions-=o")

-- In insert mode, C-u will undo everything entered on current line, leaving you in insert mode.
-- This can be used as an alternative to adjusting the formatoions. When a new line automatically
-- adds a comment, press C-u to undo it and carry on typing.

-- https://www.reddit.com/r/neovim/comments/1iofs0r/disable_o_r_formatoion_globally/
-- vim.api.nvim_create_autocmd("FileType", {
--     group = vim.api.nvim_create_augroup("user_formatoions", { clear = true }),
--     pattern = "*",
--     callback = function()
--         -- We never want the following oions
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
vim.o.list = true
-- vim.o.listchars = "tab:» ,trail:·,nbsp:␣"
vim.o.listchars = "tab:  ,trail:·,nbsp:␣"

-- Configure tab behaviour in commoand mode
vim.o.wildmode = "longest:full,full"

vim.o.spelllang = "en_nz,en_gb"

-- Better diff oions than the default:
vim.o.diffopt = "internal,filler,closeoff,linematch:60"
-- vim.o.diffopt="filler,internal,closeoff,algorithm:histogram,context:5,linematch:60"
-- vim.o.diffopt="internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"

-- https://neovim.io/doc/user/oions.html#'winborder'
vim.o.winborder = "single" -- bold, double, none, rounded, shadow, single, solid

vim.diagnostic.config({
  virtual_text = {
    prefix = "■ ", -- This square is the default, can be anything for eg "●", "▎", "x", "■", , 
  },

  virtual_lines = false,
  -- virtual_lines = { current_line = true },

  -- Uses vim.o.winborder now unless overridden
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
-- vim.o.shiftround = true
-- vim.o.backspace = '2'
-- vim.o.autowrite = true
-- vim.cmd('set path+=**')					-- search current directory recursively
-- vim.o.syntax = "ON"
-- vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- vim.o.swapfile = false -- creates a swapfile
-- vim.o.pumheight = 10					-- number of items in popup menu
-- vim.o.pumblend = 10
-- vim.o.showtabline = 2					-- always show the tab line
-- vim.o.laststatus = 2					-- always show statusline
-- vim.o.showcmd = true
-- vim.o.cmdheight = 2  -- More space in the command line for displaying messages.

-- Consider - as part of keyword
-- vim.o.iskeyword:append("-")
