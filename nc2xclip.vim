if exists("s:nc2xclip")
    finish
endif
let s:nc2xclip = 1


" netcat host/port. Defaults allow you to run nc2xclip server script
" on the receiver and connect with "ssh -R 12345:localhost:12345 ..."
" This allows the sender to not care where to send the data. It just
" gets shoved over SSH.
"
let s:host = "localhost"
let s:port = 12345

" Shamelessly stolen from a Stack Overflow post.
"   http://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
" Answered 
"   http://stackoverflow.com/a/6271254/252010
" by user "xolox".
"   http://stackoverflow.com/users/788200/xolox
"
" Get the visually selected text.
"
function! s:get_visual_selection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - 1]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endfunction

" Shove the visually selected data through netcat
"
function! s:do_nc2xclip()
    let ret = system("nc -c " . s:host . " " . s:port, s:get_visual_selection())
endfunction


" Commands
"
command -range=% Nc2Xclip call <SID>do_nc2xclip()

" key mappings
"
vnoremap <leader>y :Nc2Xclip<CR>
