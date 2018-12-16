# Emacs #
1. It has text manipulation
2. We can manage projects

## Using Only Keyboard ##
1. "C" - Control
2. "M" - Meta
3. `C-g`: quit
	1. shows `quit` in mini buffer
4. Parts
	1. Buffer/file name
	2. How much of buffer is seen
	3. Line number
	4. Mode (Default: Fundamental)
	5. %%?
5. Commands
	1. `C-x C-c` - exit
	2. `C-x C-f` - open a file
		1. type filename or TAB
			1. We can select options
		2. `helloworld.txt`
			1. `C-x C-s`
		3. Killing buffer:
			1. `C-x k` (does not delete file), press enter
	3. `C-f`: move forward one character
	4. `C-b`: move back
	5. `M-f`: move forward one word
		1. One way
			1. Press ESC
			2. Press f
		2. Second way
			1. Press Alt
			2. Press f
	6. `C-d`: delete a character
	7. `M-d`: delete a word
		1. `C-_`: undo
	8. `C-p`: previous line / up
	9. `C-n`: next line / down
	10. `C-a`: move to the beginning of a line
	11. `C-e`: move to the end of the line
	12. `M-<`: beginning of the buffer
	13. `M->`: end of the file
	14. `C-v`: page down
	15. `M-v`: page up
	16. `C-x 2`: top to bottom
	17. `C-x o`: other window
	18. `C-x 3`: left right
	19. `C-x 1`: remove all windows - simplify
	20. `C-l`: center the screen
	21. Search
		1. `C-s text`: case insensitive search
			1. Find the next one and circle
		2. `C-s Text`: case sensitive search (Enter moves cursor to end)
	22. Cut and paste
		1. `C-space`: start / toggle marking a region
		2. `M-w`: copy marked region
		3. `C-y`: yank / paste
		4. `C-w`: cut
		5. `C-k`: kill to end of line
		6. `M-y`: goes back one by one the copied text
	23. Replace
		1. `M-x query-replace` or `M-%`: y/space for yes
	24. Spell check
		1. `M-$` - select an option
		2. `M-x flyspell-mode`


		