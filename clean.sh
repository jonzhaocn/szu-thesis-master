#!/bin/bash
for dir in `ls .`
 do
   if [ -d $dir ]
   then
     echo $dir
     cd $dir
     rm *.aux
     rm *.bak
     rm *.log
     rm *.bbl
     rm *.dvi
     rm *.blg
     rm *.thm
     rm *.toc
     rm *.toe
     cd ..
   fi
done
rm *.aux
rm *.bak
rm *.log
rm *.bbl
rm *.dvi
rm *.blg

rm *.thm
rm *.toc
rm *.toe
rm *.lof 
rm *.lot
rm *.out 

rm *.fen
rm *.ten
rm *.ps

rm *.gz
rm *.synctex

rm *.loa