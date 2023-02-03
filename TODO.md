## TODO

- [C-Space] should show the autocomplete when a copilot suggestion is visible
- Undo last autocomplete suggestion when in insert mode (ie. if you `<C-n>` to
  select an item, you should be able to revert back to your previous typing with
  a different binding)
- `K` should be able to close the type info. We should also be able to trigger
  the type hover in insert mode.
- Undo copilot suggestion (ie. if you tab complete a copilot suggestion, you
  should be able to undo that easily without leaving insert mode)
- [C-o/O] in insert mode
- remove leader u mapping
- find an undo tree plugin that works with telescope
- find a lua clipboard history
- [C-space] should close the autocomplete if it is open
- Change git next/prev hunk command to also show the hunk diff
- [Esc] in terminal conflicts with vimify in ZSH
- [Enter] in insert mode doesn't indent correctly in JSX
- Prevent autopairs when completing a copilot suggestion
- Close the "go-to-definition" (ie [leader]gd) window after selecting an item
- TODO highlighting in JSX
- use Shift + j/k in place of [C-n]/[C-p]?
- use Shift + h/l in place of $/0? If so remove the key switching config I put in
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
