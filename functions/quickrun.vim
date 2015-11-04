let g:quickrun_config = {}
let g:quickrun_config['sql'] = {
            \ 'command': 'mysql',
            \ 'exec': ['%c %o < %s'],
            \ 'cmdopt': '%{MakeMySQLCommandOptions()}',
            \ }

let g:mysql_config_host = 'localhost'
let g:mysql_config_port = ''
let g:mysql_config_user = 'root'
function! MakeMySQLCommandOptions()
    if !exists("g:mysql_config_host")
        let g:mysql_config_host = input("host> ")
    endif
    if !exists("g:mysql_config_port")
        let g:mysql_config_port = input("port> ")
    endif
    if !exists("g:mysql_config_user")
        let g:mysql_config_user = input("user> ")
    endif
    if !exists("g:mysql_config_pass")
        let g:mysql_config_pass = inputsecret("password> ")
    endif
    if !exists("g:mysql_config_db")
        let g:mysql_config_db = input("database> ")
    endif

    let optlist = []
    if g:mysql_config_user != ''
        call add(optlist, '-u ' . g:mysql_config_user)
    endif
    if g:mysql_config_host != ''
        call add(optlist, '-h ' . g:mysql_config_host)
    endif
    if g:mysql_config_pass != ''
        call add(optlist, '-p' . g:mysql_config_pass)
    endif
    if g:mysql_config_port != ''
        call add(optlist, '-P ' . g:mysql_config_port)
    endif
    if exists("g:mysql_config_otheropts")
        call add(optlist, g:mysql_config_otheropts)
    endif

    call add(optlist, g:mysql_config_db)
    return join(optlist, ' ') 
endfunction
