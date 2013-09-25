" csv plugin
if exists("did_load_csvfiletype")
    finish
endif
let did_load_csvfiletype=1


" apache setting
au BufNewFile,BufRead app0,app1 setf apache

