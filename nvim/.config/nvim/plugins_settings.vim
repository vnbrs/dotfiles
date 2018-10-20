"ctrlp: fuzzy finder ignore
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|.git|vendor|tmp|temp)|(\.(swp|ico|git|svn))$'

"ale: always display gutter
let g:ale_sign_column_always = 1

"ale: lint delay
let g:ale_lint_delay = 500

"polyglot: disable vue
let g:polyglot_disabled = ['vue']

"vim-vue: highlight file from the top
autocmd FileType vue syntax sync fromstart

"vim-vue: disable preprocessors
let g:vue_disable_pre_processors=1

"lighline: settings
let g:lightline = {
\   'active': {
\       'left': [ [ 'mode', 'paste' ],
\               [ 'gitbranch' ],
\               [ 'readonly', 'filetype', 'filename' ]],
\       'right': [ [ 'percent' ], [ 'lineinfo' ],
\               [ 'fileformat', 'fileencoding' ],
\               [ 'linter_errors', 'linter_warnings' ]]
\   },
\   'component_expand': {
\       'linter': 'LightlineLinter',
\       'linter_warnings': 'LightlineLinterWarnings',
\       'linter_errors': 'LightlineLinterErrors',
\       'linter_ok': 'LightlineLinterOk'
\   },
\   'component_type': {
\       'readonly': 'error',
\       'linter_warnings': 'warning',
\       'linter_errors': 'error'
\   },
\   'component_function': {
\       'fileencoding': 'LightlineFileEncoding',
\       'filename': 'LightlineFileName',
\       'fileformat': 'LightlineFileFormat',
\       'filetype': 'LightlineFileType',
\       'gitbranch': 'LightlineGitBranch'
\   },
\   'tabline': {
\       'left': [ [ 'tabs' ] ],
\       'right': [ [ 'close' ] ]
\   },
\   'tab': {
\       'active': [ 'filename', 'modified' ],
\       'inactive': [ 'filename', 'modified' ],
\   },
\   'separator': { 'left': '', 'right': '' },
\   'subseparator': { 'left': '', 'right': '' }
\ }

function! LightlineFileName() abort
    let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
    if filename =~ 'NERD_tree'
        return ''
    endif
    let modified = &modified ? ' +' : ''
    return fnamemodify(filename, ":~:.") . modified
endfunction

function! LightlineFileEncoding()
    " only show the file encoding if it's not 'utf-8'
    return &fileencoding == 'utf-8' ? '' : &fileencoding
endfunction

function! LightlineFileFormat()
    " only show the file format if it's not 'unix'
    let format = &fileformat == 'unix' ? '' : &fileformat
    return winwidth(0) > 70 ? format . ' ' . WebDevIconsGetFileFormatSymbol() : ''
endfunction

function! LightlineFileType()
    return WebDevIconsGetFileTypeSymbol()
endfunction

function! LightlineLinter() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    return l:counts.total == 0 ? '' : printf('×%d', l:counts.total)
endfunction

function! LightlineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : '⚠ ' . printf('%d', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    return l:counts.total == 0 ? '' : '✖ ' . printf('%d', all_errors)
endfunction

function! LightlineLinterOk() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    return l:counts.total == 0 ? 'OK' : ''
endfunction

function! LightlineGitBranch()
    return "\uE725" . (exists('*fugitive#head') ? fugitive#head() : '')
endfunction

function! LightlineUpdate()
    if g:goyo_entered == 0
        " do not update lightline if in Goyo mode
        call lightline#update()
    endif
endfunction

augroup alestatus
    autocmd User ALELint call LightlineUpdate()
augroup end

"theme
let g:gruvbox_contrast_dark = 'hard'

"multiple cursor
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_normal_mode=0

"close nerdtree when ctrlp opens a file
let g:ctrlp_dont_split = 'NERD'

"open nerdtree as a sidebar on <,kb>
nmap <Leader>kb :NERDTreeToggle<CR>

"show hidden files on NERDTree
let NERDTreeShowHidden=1

"onedark theme settings
let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
colorscheme onedark
