"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Copyright (c) 2012, Eric Garver
" All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions are met: 
"
" 1. Redistributions of source code must retain the above copyright notice, this
"    list of conditions and the following disclaimer. 
" 2. Redistributions in binary form must reproduce the above copyright notice,
"    this list of conditions and the following disclaimer in the documentation
"    and/or other materials provided with the distribution. 
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
" DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
" ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
" (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
" LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
" ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
" (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
" SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("s:nc2xclip")
    finish
endif
let s:nc2xclip = 1

" source get_visual_selection()
"
runtime plugin/get_visual_selection.vim

" netcat host/port. Defaults allow you to run nc2xclip server script
" on the receiver and connect with "ssh -R 12345:localhost:12345 ..."
" This allows the sender to not care where to send the data. It just
" gets shoved over SSH.
"
let s:host = "localhost"
let s:port = 12345

" Shove the visually selected data through netcat
"
function! s:do_nc2xclip()
    let ret = system("nc -c " . s:host . " " . s:port, Get_visual_selection())
endfunction

" Commands
"
command -range=% Nc2Xclip call <SID>do_nc2xclip()

" key mappings
"
vnoremap <leader>y :Nc2Xclip<CR>
