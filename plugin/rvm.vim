" rvm.vim - Rvm
" Author:   Christopher Sexton

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
if exists('g:loaded_rvm') || &cp
  finish
endif
let g:loaded_rvm = 1

let s:cpo_save = &cpo
set cpo&vim

" Code {{{1
function! rvm#statusline(...)
  let status ="[".$rvm_ruby_interpreter." ".$rvm_ruby_version
  if !empty($rvm_gemset_name )
    let status = status."@".$rvm_gemset_name
  endif
  let status = status."]"
  if empty($rvm_ruby_interpreter )
    " If there is a default ruby rvm won't set rvm_ruby_interpreter, but
    " rvm_ruby_string will be set, so lets display that slightly less pretty
    " string.
    if !empty($rvm_ruby_string) 
      return '['.$rvm_ruby_string.']'
    else
      return ''
    endif
  else
    return status
  endif
endfunction

" }}}1

let &cpo = s:cpo_save

" vim:set ft=vim ts=8 sw=2 sts=2:
