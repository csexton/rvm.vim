" rvm.vim - Rvm
" Author:   Christopher Sexton

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
if exists('g:loaded_rvm') || &cp
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Code {{{1
function! rvm#statusline()
  return '[rvm.vim has been superseded]'
endfunction

" Only display the ruby version if the filetype is ruby.
function! rvm#statusline_ft_ruby()
  if &filetype=='ruby'
    return rvm#statusline()
  else
    return ''
  endif
endfunction
" }}}1

let &cpo = s:cpo_save

" vim:set ft=vim ts=8 sw=2 sts=2:
