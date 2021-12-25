vim.g.dashboard_default_executive ='telescope'
vim.cmd[[autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2]]
vim.g.indentLine_fileTypeExclude = 'dashboard'

--vim.g.dashboard_custom_shortcut={
--    {'last_session'       : 'SPC s l'},
--    {'find_history'       : 'SPC f h'},
--    {'find_file'          : 'SPC f f'},
--    {'new_file'           : 'SPC c n'},
--    {'change_colorscheme' : 'SPC t c'},
--    {'find_word'          : 'SPC f a'},
--    {'book_marks'         : 'SPC f b'}
--}
