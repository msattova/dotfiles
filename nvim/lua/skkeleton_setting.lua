vim.cmd[[
function! s:skkeleton_init() abort
  call skkeleton#config({
    \ 'eggLikeNewline': v:true,
    \ 'globalJisyo': 'C:\home\IME\SKK-JISYO.L'
    \ })
  call skkeleton#register_kanatable('rom', {
    \ "z\<Space>": ["\u3000", ''],
    \ })
  endfunction
  augroup skkeleton-initialize-pre
    autocmd!
    autocmd User skkeleton-initialize-pre call s:skkeleton_init()
  augroup END
  imap <C-j> <Plug>(skkeleton-toggle)
  cmap <C-j> <Plug>(skkeleton-toggle)

]]

require'skkeleton_indicator'.setup{}
