# NeoVim customizations on top of NvChad

## Setup

TODO List out the NvChad prereqs here

For the easiest setup clone this repo and then run `./install.sh`. This command will clone NvChad alongside
this repo, symlink NvChad into your `.config/nvim` folder and backup your existing nvim configs.

Once installed, copy `config/chadrc.lua.example` to `config/chadrc.lua` so you
can further customize your setup:

`cp config/chadrc.lua.example config/chadrc.lua`

All custom configuration is stored in the `config` folder and will be symlinked into NvChad.

> Good to know: Nvim settings are stored separately from your Vim settings and
> will not conflict.

Run `nvim` to start NvChad.

## NerdFonts
https://github.com/ronniedroid/getnf

### Uninstall

Run `./uninstall` to remove the NvChad symlinks and restore any previous nvim setup you had. It will not
remove the NvChad repo clone that was checked out along side this repo. You can do that if you want.

## NerdFonts
This gives us fonts and icons that work with vim. Without this you will see a
lot of broken icons in vim.

https://github.com/ronniedroid/getnf

For me this was installed into ~/.local/bin which wasn't showing up in my bash.
So I added that folder as a PATH in my .zshrc file.

Once installed run `getnf` and install the `FiraCode` font which is what
we have set as the default in `config/chadrc.lua`. You can also set this in
iTerm under Preferences -> Profile -> Text.

## Keymaps

- `<leader>tk` Search for a keymap

## Plugins

- [NvChad Plugins](https://nvchad.com/features)
- [Projects](#projects)

### Navigation

- `<leader>cc` Jump to the top of the current indent level

### Projects

[ahmedkhalf/project.nvim](https://github.com/ahmedkhalf/project.nvim)

- `[leader]fp` to open the project finder
- [project key maps](https://github.com/ahmedkhalf/project.nvim#telescope-mappings)
  are available inside the project finder window

Projects are added by starting nvim (or calling `:cd path/to/project`) in any
folder with a `.git` folder and then opening a code file. Additional project
folder patterns can be configured in `config/plugins/project.lua`.

> I've had some issues with projects showing up. Sometimes you need to open a
> project folder multiple times before it's detected.

### Git

#### [GitDiff](https://github.com/sindrets/diffview.nvim)

GitSigns shows you the removed/added/staged hunks in files, nvim tree and the
status line. You can browse the git hunks in a file with 

- `<leader>cm` Git commits in Telescope 
- `<leader>gt` Git status in Telescope
- `]c` Go to next Git hunk
- `[c` Go to previous Git hunk

In addition to the 
plugin, you also have access to [GitDiff](https://github.com/sindrets/diffview.nvim)
which allows you to view Git diffs of your working tree or history. Diffs are
opened in a new tab. Use `<leader>gs` (Git Status) to toggle the diff view of
your current working tree. See `h: diffview` for documentation.

### Github Copilot
https://github.com/github/copilot.vim - This works after adding `vim.g.copilot_assume_mapped = true` to `config/init.lua`
https://github.com/zbirenbaum/copilot.lua - Havent tried this but it exists.

### Snippets

Snippet functionality is provided by [luasnip](https://github.com/L3MON4D3/LuaSnip)
with [friendly snippets](https://github.com/rafamadriz/friendly-snippets)
installed as well. Additionally, you can add your own snippets by adding snippet
JSON files in the `snippets` folder. Snippets must be VSCode snippet format and
the files must be named `{filetype}.json` and be valid JSON. If your snippets
aren't loading, it's because there are JSON format issues or your snippet
definitions don't match the VSCode snippet format. To easily create new
snippets, you can use [this online snippet generator](https://snippet-generator.app/)

To use snippets, try typing "aptreactfunc" in a typescript file, select the
snippet in the autocomplete, type a name for your component, type `<TAB>` to
move to the next edit location, repeat...

## Configure

- A good overview of [lua config with Neovim](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
- The official [Neovim configuration with lua guide](https://neovim.io/doc/user/lua-guide.html#lua-guide)

## TODO

- [C-space] should close the autocomplete if it is open
- Change git next/prev hunk command to also show the hunk diff
- [Esc] in terminal conflicts with vimify in ZSH
- [Enter] in insert mode doesn't indent correctly in JSX
- TODO highlighting in JSX
- use Shift + j/k in place of [C-n]/[C-p]?
- use Shift + h/l in place of $/0? If so remove the key switching config I put
in
- scroll to left/right edge without moving cursor in normal and insert modes
- scroll up/down by 5 lines without moving cursor in normal and insert modes
- navigate up/down by 10 lines
- navigate back/forward inside camel case words
- [leader]] doesn't seem to work
- surround plugin (ex: cs')
- hide autocomplete with escape or [C-c]
- hide floating error text (show on hover)
- re-paste last pasted content
- keybindng to jump to beginning of line
- prettier/eslint 
- show file name at top or bottom of each window
- Tmux [C-HJKL] integeration (Temporary?)
- keymap to clear terminal scrollback
- keymap for [Up] [Down] in terminal ([D-Up/Down]?)
- [leader]b last buffer
- s keymap for :w
- sa keymap for :wa
- Different minwidth for terminal windows
- color border or background of focused window
  https://github.com/blueyed/vim-diminactive
- [leader]b to go back to previous buffer
- prevent terminal window from entering terminal mode when the cursor enters it?
- Esc to exit lsp.hover modal (ie. KK will open hover and focus it but it's hard
to exit...use [C-J])
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
- close GitSigns preview window with [Esc]. See https://github.com/lewis6991/gitsigns.nvim/issues/385

Plugins:
- split join
- surround
- Gundo
- Taboo?
- jest.nvim?
- system status graph

### New things to add

- terminal autocomplete
- comment function by typing [leader]/ inside the body of the function
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

To perform a project wide search and replace...

- `<leader>fw` to search the project for the text you want to replace
- `[Ctrl-q]` to move the search results to the quickfix window
- type `cdo s/{SEARCH_TEXT}/{REPLACEMENT_TEXT}/g` or (use `/gc` to manually
  approve each change)

See https://github.com/nvim-lua/wishlist/issues/18#issuecomment-812092951

## Useful Key Bindings

### (N)Vim

Some notes to self that helped me a lot

- `zz` vertically center buffer on cursor location

### TODO key mappings for these:
- `:cd {path}` Change the current working directory. Useful for changing the `vim-tree`
root folder. Path is relative to the current working directory or your home directory if not set. See `:h cd`
- `:td {path}` Same as `:cd` but just for the current tab.
