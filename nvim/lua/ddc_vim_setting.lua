
vim.cmd[[
call ddc#custom#patch_global('sources', [
    \ 'around',
    \ 'file',
    \ 'nvim-lsp',
    \ 'skkeleton'
    \ ])
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \    'matchers': ['matcher_head'],
    \    'sorters' : ['sorter_rank'],
    \    'converters' : ['converter_remove_overlap'],
    \ },
    \ 'skkeleton': {
    \    'mark': 'skkeleton',
    \    'matchers': ['skkeleton'],
    \    'sorters': [],
    \    'minAutoCompleteLength': 2,
    \ },
    \ 'nvim-lsp': {
    \    'mark': 'lsp',
    \    'forceCompletionPattern': '\.\w*|:\w*|->\w*'
    \ },
    \ 'file': {
    \   'mark': 'file',
    \   'isVolatile': v:true,
    \   'forceCompletionPattern': '\S/\S*'
    \ }
    \ })
call ddc#custom#patch_global('completionMenu', 'pum.vim')
inoremap <silent><expr> <TAB>
    \ pum#visible() ? '<Cmd> call pum#map#insert_relative(+1)<CR>' :
    \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
    \ '<TAB>' : ddc#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n> <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p> <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y> <Cmd>call pum#map#confirm()<CR>
inoremap <C-e> <Cmd>call pum#map#cancel()<CR>
]]
