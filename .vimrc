set nocompatible              " be iMproved, required
filetype off                  " required

set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'davidhalter/jedi-vim'

call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" jedi-vim
" to get help :help jedi-vim
" please read chapter 5 first
let g:jedi#completions_command = "<C-N>"
" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
from os.path import expanduser
home = expanduser("~")
sys.path.insert(0, '%s/src/work/joudou/Backend/_9data/' %(home))
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, os.path.join(project_base_dir, 'lib', 'python%d.%d' % sys.version_info[:2], 'site-packages'))
EOF
endif
let g:jedi#use_tabs_not_buffers=0
let g:jedi#use_splits_not_buffers='left'
