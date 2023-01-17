# NeoVim customizations on top of NvChad

## Setup

For the easiest setup clone this repo and then run `./install.sh`. This command will clone NvChad alongside
this repo, symlink NvChad into your `.config/nvim` folder and backup your existing nvim configs.

All custom configuration is stored in the `config` folder and will be symlinked into NvChad.

> Good to know: Nvim settings are stored separately from your Vim settings and
> will not conflict.

Run `nvim` to start NvChad.

### Uninstall

Run `./uninstall` to remove the NvChad symlinks and restore any previous nvim setup you had. It will not
remove the NvChad repo clone that was checked out along side this repo. You can do that if you want.

## NerdFonts
https://github.com/ronniedroid/getnf

## TODO

- Change git next/prev hunk command to also show the hunk diff
- <Esc> in terminal conflicts with vimify in ZSH
- <Enter> in insert mode doesn't indent correctly in JSX
- TODO highlighting in JSX
- use Shift + j/k in place of <C-n>/<C-p>?
- use Shift + h/l in place of $/0? If so remove the key switching config I put
in
- scroll to left/right edge without moving cursor
- navigate up/down by 10 lines
- navigate back/forward inside camel case words
- <leader>] doesn't seem to work
- surround plugin (ex: cs')
- hide autocomplete with escape or <C-c>
- hide floating error text (show on hover)
- re-paste last pasted content
- keybindng to jump to beginning of line
- prettier/eslint 
- show file name at top or bottom of each window
- Tmux <C-HJKL> integeration (Temporary?)
- keymap to clear terminal scrollback
- keymap for <Up> <Down> in terminal (<D-Up/Down>?)
- <leader>b last buffer
- s keymap for :w
- sa keymap for :wa
- Different minwidth for terminal windows
- color border or background of focused window
  https://github.com/blueyed/vim-diminactive
- <leader>b to go back to previous buffer
- prevent terminal window from entering terminal mode when the cursor enters it?
- Esc to exit lsp.hover modal (ie. KK will open hover and focus it but it's hard
to exit...use <C-J>)
- keymap to jump to open terminal if there is one
- open url:
https://stackoverflow.com/questions/68694479/how-do-i-open-a-link-in-google-chrome-in-lua-for-neovim
- colorize console log statements in jest output (or maybe just use a jest
plugin)
- autocomplete suggestions should prioritize fields first
- close all hidden buffers
- checktime of open buffers when vim window regains focus
- change zsh cursor to an insert cursor
- only turn on line highlight for the current buffer
- keymap to show the row and column highlight in a bright color so I can find
the cursor

Plugins:
- split join
- surround
- Gundo
- Taboo?
- jest.nvim?
- system status graph

### New things to add

- terminal autocomplete
- comment function by typing <leader>/ inside the body of the function
- keymap to show time in big letters
- plugin to flash the screen when a calendar event happens
- Alt and Cmd backspace/delete to delete full words?

### Neovide

- insert emoji on osx
- cursor jumps when autocomplete dialog is open while typing

### Questions

- Would Neovide be faster with a non-ligagure font?
- Would Neovide be faster with a slower refresh rate?
- Would Neovide be faster without animations?
- Would Neovide be faster without multigrid?
- Would Neovide be faster if autocomplete menues had to be opened manually?
- Would Neovide be faster with Jest plugin (rather than a terminal)?
- Would Neovide be faster without runing tests at all?
- what does the = character in normal mode do?

## Learning NvChad

- Read about the [plugins that come with NvChad](https://github.com/NvChad/NvChad)
- Read the default key mappings provided in `NvChad/lua/core/mappings.lua`
- Learn how to [customize NvChad](https://nvchad.com/config/Walkthrough)
- Learn how to customize [NeoVim options with lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)

## Project wide Search and Replace

https://github.com/nvim-lua/wishlist/issues/18#issuecomment-812092951

## Useful Key Bindings

### (N)Vim

Some notes to self that helped me a lot

- `zz` vertically center buffer on cursor location

### TODO key mappings for these:
- `:cd {path}` Change the current working directory. Useful for changing the `vim-tree`
root folder. Path is relative to the current working directory or your home directory if not set. See `:h cd`
- `:td {path}` Same as `:cd` but just for the current tab.
