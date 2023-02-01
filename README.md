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

### Working with Projects

[ahmedkhalf/project.nvim](https://github.com/ahmedkhalf/project.nvim)

From the start page, you move to the Projects line and type `<CR>` (or type
`<leader>se` for settings). This will open Telescope with a list of your
previously opened projects. Select a project from the list (`<C-n/p><CR>`) and
then search for a file to open and select it with `<CR>`. Now your current
working directory is the project root.

Projects are added by starting nvim (or calling `:cd path/to/project`) in any
folder with a `.git` folder and then opening a code file. Additional project
folder patterns can be configured in `config/plugins/project.lua`.

> I've had some issues with projects showing up. Sometimes you need to open a
> project folder multiple times before it's detected.

- `<leader>fp` to open the project finder
- [project key maps](https://github.com/ahmedkhalf/project.nvim#telescope-mappings)
  are available inside the project finder window

### Working with the autocomplete

- [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  The generic autocomplete popup that opens as you type. See `h: nvim-cmp` for
  help.
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
  Copilot plugin written in lua for better performance. See GitHub page for
  help.

When in insert mode, you should get an autocomplete menu. Use `<C-space>` in
insert mode to open or close the dialog. When the dialog is open, use `<C-n/p>`
to navigate to the next/previous items. You will also see Copilot suggestions
written as ghost text after your cursor which you can accept using `<Tab>` (in
insert mode).

If you select an item marked "Snippet" in the autocomplete, it will populate the
snippet code for you and place you in the first edit location for that snippet.
You can now type some text and then type `<Tab>` to move to the next edit
location. Repeat until there are no more edit locations.

> NOTE: I've noticed a couple bugs in our current implementation.
> - If the copilot suggestion is show before the autocomplete, you can't toggle
>   the autocomplete window.
> - If the documentation window is open, you cannot `Tab` complete a copilot
>   suggestion.
> - Copilot suggestions and snippet navigation sometimes conflict. We should
>   disable copilot while we are in a snippet.

### Working with Git

- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
  Shows you the removed/added/staged hunks within your open buffers, nvim tree and the status line.
  Try `:Gitsigns <TAB>` to view the available commands or `h: Gitsigns` for
  help.
- [GitDiff](https://github.com/sindrets/diffview.nvim)
  A diff viewer for Git staging and navigationg the Git history.
  Try `:Diffview<TAB>` to view available commands or `h: Diffivew` for help.
- [NeoGit](https://github.com/TimUntersberger/neogit)
  An easy UI for performing Git commands. Visit GitHub for help.

When working in a file, the number column will show you unstaged file changes
with a colored bar. Type `]c` and `[c` to navigate between changes in the file. You
can stage/unstage changes with `<leader>cs` (Commits Stage) and the left column color
will be removed. You can also quickly show a diff of the unstaged lines with
`<leader>cd` (Commits Diff). Or you can toggle an inline view of all unstaged
changes with `<leader>ch` (Commits Highlight).

You can quickly review your current Git changes in a floating window by pressing
`<leader>gt` (Git Telescope). Use `<C-n/p>` to show the diff of the next/previous file. Use
`<C-d/u>` to scroll the preview window up/down. Use `?` to show Telescope key
commands at the bottom of the screen.

For a more complete staging experience, you can use `<leader>gs` (Git Stage) to
open a new tab with a diff view of the current Git state. Use `j/k` to
navigate between files and `<CR>` to show the diff for the selected file. The
Gitsigns commands work in the diff buffers as well so you can jump between
hunks, stage them, etc.

#### Cheatsheat

- `<leader>gt` Git status in Telescope
- `]c` Go to next Git hunk
- `[c` Go to previous Git hunk
- `<leader>cs` Stage hunk under cursor
- `<leader>ch` Show inline git changes
- `<leader>td` Show file diff
- `<leader>gs` Show the project wide git changes
- `<leader>gg` Git GUI
- `<leader>cm` Browse Git commits in Telescope 
- `<leader>gh` View detailed Git history in a tab

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
- [Getting started with NeoVim](https://bryankegley.me/posts/nvim-getting-started/)
- Learn how to [customize NvChad](https://nvchad.com/config/Walkthrough)
- Learn how to customize [NeoVim options with lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)

## Project wide Search and Replace

To perform a project wide search and replace...

- `<leader>fw` to search the project for the text you want to replace
- `<Ctrl-q>` to move the search results to the quickfix window
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
