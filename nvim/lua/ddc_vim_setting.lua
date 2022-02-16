
vim.cmd[[
call ddc#custom#patch_global('sources', [
    \ 'around',
    \ 'file'
    \ ])
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \    'matchers': ['matcher_head'],
    \    'sorters' : ['sorter_rank'],
    \    'converters' : ['converter_remove_overlap'],
    \ },
    \ 'file': {
    \   'mark': 'file',
    \   'isVolatile': v:true,
    \   'forceCompletionPattern': '\S/\S*'
    \ }
    \ })
call ddc#custom#patch_global('completionMenu', 'pum.vim')

call ddc#enable()
inoremap <silent><expr> <TAB>
    \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
    \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
    \ '<TAB>' : ddc#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>  <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>  <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>  <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>  <Cmd>call pum#map#cancel()<CR>
inoremap <PageDown>  <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <PageUp>  <Cmd>call pum#map#select_relative(-1)<CR>

call ddc#custom#patch_global('autoCompleteEvents', [
    \ 'InsertEnter', 'TextChangedI', 'TextChangedP',
    \ 'CmdlineEnter', 'CmdlineChanged',
    \ ])

nnoremap :       <Cmd>call CommandlinePre()<CR>:

function! CommandlinePre() abort
  " Note: It disables default command line completion!
  cnoremap <expr> <Tab>
  \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
  \ ddc#manual_complete()
  cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
  cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
  cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

  " Overwrite sources
  let s:prev_buffer_config = ddc#custom#get_buffer()
  call ddc#custom#patch_buffer('sources',
          \ ['cmdline', 'cmdline-history', 'around'])

  autocmd User DDCCmdlineLeave ++once call CommandlinePost()

  " Enable command line completion
  call ddc#enable_cmdline_completion()
  call ddc#enable()
endfunction
function! CommandlinePost() abort

endfunction

]]
