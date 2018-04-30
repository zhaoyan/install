let g:syntastic_quiet_messages = {
    \ 'regex': [ 'TAB character in verbatim environment','Dots should be ellipsis','double space at','missing `\\@. before', 'missing `\\ . after', 'Use ` to begin quotation, not', 'tespace before punctation mark in','possible unwanted space at' ]
    \ }
syntax region texZone start='\\begin{lstlisting}' end='\\end{lstlisting}'
