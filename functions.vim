function! SetTabs (tabsize)
	let l:tabs=a:tabsize
	let &tabstop=l:tabs
	let &shiftwidth=l:tabs
	if (l:tabs == 4)
		set noexpandtab
	else
		set expandtab
	end
endfunction

" autocmd InsertEnter * set nocursorline
" autocmd InsertLeave * set cursorline

function! ToggleCursorLine ()
	if (!exists ("b:toggle_cursor_mode"))
		let b:toggle_cursor_mode = 1
	endif
	if (b:toggle_cursor_mode == 0)
		autocmd InsertEnter * set nocursorline
		autocmd InsertLeave * set cursorline
		set cursorline
		" echo "Cursor line highlight ENABLED"
		let b:toggle_cursor_mode = 1
	else
		autocmd InsertEnter * set nocursorline
		autocmd InsertLeave * set nocursorline
		" echo "Cursor line highlight DISABLED"
		set nocursorline
		let b:toggle_cursor_mode = 0
	endif
endfunction

call ToggleCursorLine ()

