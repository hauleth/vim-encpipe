if exists("g:loaded_encpipe")
  finish
endif
let g:loaded_encpipe = 1

augroup Encpipe
  au!
  au BufReadPre  *.enc setl noswapfile noundofile
  au BufReadCmd  *.enc call encpipe#decrypt()
  au BufWriteCmd *.enc call encpipe#encrypt()
augroup END

command! EncpipePass let b:encpipe_password = inputsecret("pass> ")
