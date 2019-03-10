mkdir backup
copy *.hx backup
for %%f in (*.hx) DO ( 
    uncrustify -c uncrustify.cfg -l CS  -f %%f -o %%f
)
move *~ backup
