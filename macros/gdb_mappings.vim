" Mappings example for use with gdb
" Maintainer:	<kisow@naver.com>
" Last Change:	2013/08/23

au BufNewFile,BufReadPost (clewn)_console set ft=gdb

" Non ho capito a cosa serve
"nmap <F10> :bel 50vs gdb-variables<cr><C-W>p

let s:gdb_k = 1

nmap <F11> :call <SID>gdb_toggle(1)<CR>
nmap <F12> :call <SID>gdb_toggle(0)<CR>


let g:pyclewn_args = "--window=bottom --gdb=async --terminal=xterm,-e"
" let g:pyclewn_args = "--window=bottom --gdb=async --tty=/dev/pts/1"
" let g:pyclewn_terminal = "xterm, -e"

" gdb_toggle between vim default and custom mappings
function! s:gdb_toggle(start_stop)
    if s:gdb_k
        let s:gdb_k = 0

        map <Space> :C 
        nmap <silent> B :C info breakpoints<CR>
        nmap <silent> L :C info locals<CR>
        nmap <silent> A :C info args<CR>
        nmap <silent> s :C step<CR>
        nmap <silent> S :C stepi<CR>
        nmap <silent> n :C next<CR>
        nmap <silent> N :C nexti<CR>
        nmap <silent> f :C finish<CR>
        nmap <silent> r :C run<CR>
        nmap <silent> q :C quit<CR>
        nmap <silent> c :C continue<CR>
        nmap <silent> w :C where<CR>
        nmap <silent> <F6> :C up<CR>
        nmap <silent> <F5> :C down<CR>
        nmap <silent> <F4> :C set follow-fork-mode parent<CR>
        nmap <silent> <F3> :C set follow-fork-mode child<CR>
        nmap <silent> <F9> :C set print pretty<CR>

        " set/clear bp at current line
        nmap <silent> b :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>
        nmap <silent> e :exe "Cclear " . expand("%:p") . ":" . line(".")<CR>
        nmap <silent> u :exe "Cuntil " . expand("%:p") . ":" . line(".")<CR>

        " print value at cursor
        nmap <silent> p :exe "Cprint " . expand("<cword>")<CR>
        
        " print value referenced by word at cursor
        nmap <silent> P :exe "Cprint *" . expand("<cword>")<CR>

        " print string at cursor
        nmap <silent> t :exe "Cprintf \\\"%s\\n\\\", " . expand("<cword>") . ".c_str()"<CR>

        " print string at cursor
        nmap <silent> T :exe "Cprintf \\\"%s\\n\\\", (const char*) " . expand("<cword>") . ""<CR>

        " display Visual selected string
        vmap <silent> t y:exe "Cprintf \\\"%s\\n\\\", (const char*) " . "<C-R>" . ".c_str()"<CR>

        " display Visual selected string
        vmap <silent> T y:exe "Cprintf \\\"%s\\n\\\", (const char*) " . "<C-R>""<CR>

        " display Visual selected expression
        vmap <silent> p y:exe "Cprint " . "<C-R>""<CR>
        
        if a:start_stop
            execute ":silent Pyclewn"
        else
            "echohl ErrorMsg
            echo "using debug keymap"
            "echohl None
        endif    
    " Restore vim defaults
    else
        " Set the mode variable
        let s:gdb_k = 1
       
        if a:start_stop
            execute ":Cexitclewn"
        else
            "echohl ErrorMsg
            echo "using default keymap"
            "echohl None
        endif    
        
        " Unmap all the keys    
        unmap <Space>
        nunmap B
        nunmap L
        nunmap A
        nunmap s
        nunmap S
        nunmap n
        nunmap N
        nunmap f
        nunmap r
        nunmap q
        nunmap c
        nunmap w
        nunmap <F6>
        nunmap <F5>
        nunmap <F4>
        nunmap <F3>
        nunmap <F9>
        nunmap b
        nunmap e
        nunmap p
        nunmap P
        nunmap t
        nunmap T
        nunmap u
        vunmap t
        vunmap T
        vunmap p
    endif
endfunction

" map pyclewn gdb keymap
" call s:gdb_toggle()

