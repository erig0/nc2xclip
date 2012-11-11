"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Shamelessly stolen from a Stack Overflow post.
"   http://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
" Answered 
"   http://stackoverflow.com/a/6271254/252010
" by user "xolox".
"   http://stackoverflow.com/users/788200/xolox
"
" Get the visually selected text.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Get_visual_selection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - 1]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endfunction
