local o = vim.opt

-- Editor options
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

o.smarttab = true
o.smartindent = true
o.autoindent = true
o.breakindent = true

o.number = true
o.relativenumber = true

o.cursorline = true -- Highlight the screen line of the cursor with CursorLine.

o.undofile = true

o.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes

o.showmode = false

o.ignorecase = true
o.smartcase = true

o.signcolumn = "yes"

o.splitright = true
o.splitbelow = true -- When on, splitting a window will put the new window below the current one

o.clipboard:append("unnamedplus")

o.syntax = "on" -- When this option is set, the syntax with this name is loaded.
o.encoding = "UTF-8" -- Sets the character encoding used inside Vim.

o.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed

o.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
o.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.

o.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.

o.termguicolors = true

o.scrolloff = 5
