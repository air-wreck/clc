#!/bin/bash
# N.B. this script depends on some pdf utilities that you may need to install
# I think you need Ghostscript + LaTeX...maybe Poppler?

# book number to assemble: pass as command line argument
BOOK_NO=$1

echo "assembling CLC Stage ${BOOK_NO} pdfs"

echo "finding and cropping all matching pdfs..."
for f in ./clc${BOOK_NO}_p*[0-9].pdf; do
  pdfcrop --margins "-4 -2 -4 -4" $f > /dev/null
done

echo "merging cropped pdf files"
cropped=$(ls clc${BOOK_NO}_p*-crop.pdf | sort -n -t _ -k 3)
gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=clc_stage${BOOK_NO}.pdf ${cropped}

echo "cleaning cropped pdf files"
rm clc${BOOK_NO}*-crop.pdf

echo "process done. output written to clc_stage${BOOK_NO}.pdf"
