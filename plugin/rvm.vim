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
function! rvm#statusline()
  let status = ''

  let rvm_gemset = system('rvm gemset name')
  let rvm_gemset = strpart(rvm_gemset, 0, strlen(rvm_gemset) - 1)

  if !empty($rvm_ruby_interpreter)
    let status = $rvm_ruby_interpreter.' '.$rvm_ruby_version
  elseif !empty($rvm_ruby_string)
    " If there is a default ruby $rvm_ruby_interpreter is empty, so fall back
    " to $rvm_ruby_string
    let status = $rvm_ruby_string
  endif

  if !empty(rvm_gemset)
    let status = status.'@'.rvm_gemset
  endif

  if !empty(status)
    let status = '['.status.']'
    return status
  else
    return ''
  endif
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
