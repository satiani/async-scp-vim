" Drop this in ~/.vim/plugin and configure appropriate parameters in your
" ~/.vimrc
if exists('g:AsyncScpLoaded')
  finish
endif
let g:AsyncScpLoaded = 1

if !exists('g:AsyncScpExecutable')
  let g:AsyncScpExecutable = "~/code/async-scp/async-scp.sh"
endif

if !exists('g:AsyncScpPath')
  let g:AsyncScpPath = "~/development/Web/"
elseif strpart(g:AsyncScpPath, -1) != "/"
  let g:AsyncScpPath .= "/"
endif

exec 'au BufWritePost ' . g:AsyncScpPath . '* :silent !' . g:AsyncScpExecutable '%:p'
