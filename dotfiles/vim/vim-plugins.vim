Plug 'vim-syntastic/syntastic'

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '⚡ '
let g:syntastic_style_warning_symbol = '⚡ '
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \   'active_filetypes': ['python', 'javascript', 'coffee'],
            \   'passive_filetypes': ['html', 'css', 'scss', 'c', 'cpp'],
            \ }
let g:syntastic_python_pylint_post_args='--disable=E1101,W0613,C0111'
let g:syntastic_python_checkers = ['pylint2']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_ignore_errors =
            \ ["proprietary attribute \"autofocus", "proprietary attribute \"ui-", "proprietary attribute \"ng-", "<form> proprietary attribute \"novalidate\"", "<form> lacks \"action\" attribute", "trimming empty <span>", "<input> proprietary attribute \"autofocus\"", "unescaped & which should be written as &amp;", "inserting implicit <span>", "<input> proprietary attribute \"required\"", "trimming empty <select>", "trimming empty <button>", "<img> lacks \"src\" attribute", "plain text isn't allowed in <head> elements", "<html> proprietary attribute \"app\"", "<link> escaping malformed URI reference", "</head> isn't allowed in <body> elements", "<script> escaping malformed URI reference", "discarding unexpected <body>", "'<' + '/' + letter not allowed here", "missing </script>", "proprietary attribute \"autocomplete\"", "trimming empty <i>", "proprietary attribute \"required\"", "proprietary attribute \"placeholder\"", "<ng-include> is not recognized!", "discarding unexpected <ng-include>", "missing </button>", "replacing unexpected button by </button>", "<ey-confirm> is not recognized!", "discarding unexpected <ey-confirm>", "discarding unexpected </ey-confirm>", "discarding unexpected </ng-include>"]

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

let NERDTreeWinSize = 42
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMouseMode = 2
let NERDTreeHijackNetrw = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = [
            \ '\~$', '\.pyc$', '\.pyo$', '\.class$', '\.aps',
            \ '\.git', '\.hg', '\.svn', '\.sass-cache',
            \ '\.tmp$', '\.gitkeep$', '\.idea', '\.vcxproj',
            \ '\.bundle', '\.DS_Store$', '\tags$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> ` :NERDTreeToggle<CR>

Plug 'wesleyche/SrcExpl'

let g:SrcExpl_winHeight = 15
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_pluginList = [
            \ "__Tag_List__",
            \ "_NERD_tree_",
            \ "Source_Explorer"
            \ ]
let g:SrcExpl_colorSchemeList = [
            \ "Red",
            \ "Cyan",
            \ "Green",
            \ "Yellow",
            \ "Magenta"
            \ ]
let g:SrcExpl_searchLocalDef = 1
let g:SrcExpl_nestedAutoCmd = 1
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey = "<F12>"
let g:SrcExpl_prevDefKey = "<F3>"
let g:SrcExpl_nextDefKey = "<F4>"

nnoremap <F8> :SrcExplToggle<CR>

Plug 'majutsushi/tagbar'

let g:tagbar_width = 40
let g:tagbar_autofocus = 1

nnoremap <F9> :TagbarToggle<CR>

Plug 'jsfaint/gen_tags.vim'

let g:gen_tags#ctags_use_cache_dir = 0

Plug 'ronakg/quickr-cscope.vim'

let g:quickr_cscope_keymaps = 0
let g:quickr_cscope_program = 'gtags-cscope'
let g:quickr_cscope_db_file = 'GTAGS'
let g:quickr_cscope_autoload_db = 0

nnoremap <leader>s <Plug>(quickr_cscope_symbols)
nnoremap <leader>g <Plug>(quickr_cscope_global)
nnoremap <leader>c <Plug>(quickr_cscope_callers)
nnoremap <leader>d <Plug>(quickr_cscope_functions)

Plug 'Yggdroot/indentLine'

Plug 'scrooloose/nerdcommenter'

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

Plug 'junegunn/vim-easy-align'

xmap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

Plug 'alvan/vim-closetag'

let g:closetag_filenames = '*.html,*.js,*.jsx'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'

Plug 'hallison/vim-markdown', { 'for': 'markdown' }
Plug 'elzr/vim-json', { 'for': 'json' }

Plug 'othree/html5.vim', { 'for': ['html', 'djangohtml'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css', 'sass', 'scss', 'less', 'djangohtml'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'djangohtml'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'html'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'html'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'html'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'html'] }
Plug 'isRuslan/vim-es6', { 'for': ['javascript', 'html'] }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'Quramy/vim-js-pretty-template', { 'for': 'typescript' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'jason0x43/vim-js-indent', { 'for': ['javascript', 'typescript'] }
Plug 'neoclide/vim-jsx-improve', { 'for': ['jsx', 'javascript.jsx'] }

Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python', 'python3', 'djangohtml'] }

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
