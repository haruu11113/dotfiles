" vimrc
" vim-lspの各種オプション設定
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1

let s:pyls_path = fnamemodify(g:python3_host_prog, ':h') . '/'. 'pyls'

if (executable('pyls'))
    " pylsの起動定義
    augroup LspPython
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': { server_info -> [expand(s:pyls_path)] },
      \ 'whitelist': ['python'],
      \ 'workspace_config': {'pyls': {'plugins': {
      \   'pycodestyle': {'enabled': v:true},
      \   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
      \ })
    augroup END
endif

nnoremap <C-]> :<C-u>LspDefinition<CR>
nnoremap K :<C-u>LspHover<CR>
nnoremap <LocalLeader>R :<C-u>LspRename<CR>
nnoremap <LocalLeader>n :<C-u>LspReferences<CR>
nnoremap <LocalLeader>f :<C-u>LspDocumentDiagnostics<CR>
nnoremap <LocalLeader>s :<C-u>LspDocumentFormat<CR>
set omnifunc=lsp#complete
