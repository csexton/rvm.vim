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

  " Are we even using rvm?
  if !empty($rvm_path)
    if !empty($GEM_PATH)
      let status = substitute(split($GEM_PATH, ':')[0], '.*/', '', '')
    else
      let status = ''
    end
    " I can't decide if we need this: is there ever a case where
    " GEM_PATH is empty but RUBY_VERSION is _not_ empty?
    "
    " if empty(status)
      " let status = $RUBY_VERSION
    " endif
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
