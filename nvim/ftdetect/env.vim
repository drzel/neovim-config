augroup env
  autocmd!
  autocmd BufNewFile,BufRead .env.* setfiletype sh
augroup END
