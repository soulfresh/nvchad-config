## TODO

### Navigation
- [C-o/O] in insert mode
- use Ctrl + j/k in place of [C-n]/[C-p]?
- scroll to left/right edge without moving cursor in insert mode?
- scroll up/down by 5 lines without moving cursor in insert modes
- navigate up/down by 10 lines
- navigate back/forward inside camel case words
- [leader]b to go back in buffer history (like Shift Tab but goes back by buffer
  last visited time)
- Jump to end of current indent level
- Alt and Cmd backspace/delete to delete full words?

### Autocomplete
- Undo last autocomplete suggestion when in insert mode (ie. if you `<C-n>` to
  select an item, you should be able to revert back to your previous typing with
  a different binding)
- hide autocomplete with escape or [C-c]
- Undo copilot suggestion (ie. if you tab complete a copilot suggestion, you
  should be able to undo that easily without leaving insert mode)
- Prevent autopairs when completing a copilot suggestion

### Undo and copy/paste
- find an undo tree plugin that works with telescope
- find a lua clipboard history like yank ring
- re-paste last pasted content
- [D-v] to paste in insert mode
- paste in terminal mode

### Terminal
- prevent terminal window from entering terminal mode when the cursor enters it?
  The nvterm config parameter doesn't seem to work; need to push a PR
- [Esc] in terminal conflicts with vimify in ZSH
- Tmux [C-HJKL] integeration (Temporary?)
- Different minwidth for terminal windows
- keymap to jump to open terminal if there is one
- [C-c] in normal mode in a terminal should enter terminal mode and pass through
  the [C-c] key code
- Can we do anything to redirect merge edit to a vim buffer when running a merge
  from the terminal?
- Change the terminal background color, border, caret color or something else to
  indicate when we are in terminal mode vs normal mode

### Type/Diagnostics Tooltips
- `K` should be able to close the type info. We should also be able to toggle
  the type hover in insert mode.
- Esc to exit lsp.hover modal (ie. KK will open hover and focus it but it's hard
to exit...use [C-J])
- hide floating error text (show on hover)
- close GitSigns preview window with [Esc]. See https://github.com/lewis6991/gitsigns.nvim/issues/385
- add border around diagnostic tooltip (it's hard to see where it wraps
  sometimes)

### Other
- `gq` is not working
- leader w to remove whitespace
- remove leader u mapping
- [Enter] in insert mode doesn't indent correctly in JSX
- Close the "go-to-definition" (ie [leader]gd) window after selecting an item
- surround plugin (ex: cs')
- prettier/eslint 
- show file name at top or bottom of each window
- color border or background of focused window
  https://github.com/blueyed/vim-diminactive
- open url:
https://stackoverflow.com/questions/68694479/how-do-i-open-a-link-in-google-chrome-in-lua-for-neovim
- colorize console log statements in jest output (or maybe just use a jest
  plugin)
- close all hidden buffers
- checktime of open buffers when vim window regains focus
- change zsh cursor to an insert cursor
- only turn on line highlight for the current buffer
- keymap to show the row and column highlight in a bright color so I can find
the cursor (or some otherway to locate the cursor)

Plugins:
- .h to .cpp with ProtoDef: https://www.vim.org/scripts/script.php?script_id=2624
- split join 
  TreeSJ https://github.com/Wansmer/treesj#settings
- surround
- Gundo
- Taboo?
- jest.nvim?
- system status graph
- 

### New things to add

- note taking
  https://github.com/xolox/vim-notes
- clock
  Key binding to temporarily show the time as an overlay:
  https://github.com/iamcco/clock.nvim
- terminal autocomplete
- comment function by typing [leader][leader]/ inside the body of the function
- keymap to show time in big letters
- plugin to flash the screen when a calendar event happens
