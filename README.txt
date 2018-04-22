The following may be slightly illegal:

These are some tools to pirate the Cambridge Latin Course textbooks. This is
not for profit.

The .html files create pages with the corresponding web books. You need to
manually adjust the range of pages each time, since there is a limit on the
number of simultaneous requests allowed. I am experimenting with automatically
waiting for a bit and then sending the requests. You also need to manually
identify the title pages. Also, adjust the URL accordingly for the book number.
Oh, and run the insert_styling() function manually. Actually, this is really
confusing. Just jump to the bottom for detailed instructions.

When the .html page is loaded (check the console for finished message, then
wait a bit as per instructions), print it with Chrome's print to pdf utility.
Note that you need to start Chrome with security settings disabled for it to
work; on MacOS, this can be achieved with:

  open -n -a Google\ Chrome --args --disable-web-security --user-data-dir=/tmp/chrome

(ignore the warning message you get). Name the pdfs like this: clc1_p_1_21.pdf.
When you have all the .pdf files (named exactly like that), run the provided
assemble.sh script to compile them into clc_stage1.pdf (etc. for other stages).
They require Ghostscript and I think LaTeX to work correctly. Note that you
must manually pass the book number to assemble.sh as a command line argument.

The results of all this can be seen at (up as of 4/21/18) http://54.191.167.183

EDIT: After switching to the right edition, you *can* request as many pages as
you want, but it's recommended to stick to increments of 100, since too many
iframes make the page load REALLY slowly. Not sure if you need to be signed in
to Cambridge Elevate to use it...doesn't look like it?

So, the overall process for obtaining the Stage 1 web book would be:

  1. Change the base URL in clc.html to reflect the stage number
  2. Change the `STAGE_NO` variable in clc.html to reflect the stage number
  3. Open Google Chrome with the `--disable-web-security` flag (see above)
  4. Change the page range in clc.html (variables at the beginning) to 1..101
  5. Open clc.html in Chrome
  6. When clc.html has fully loaded, run `insert_styling()` in the developer
     console
  7. When you see the page ready again, print to PDF with Chrome's builtin
     utility (please switch the paper to landscape...)
     Name the file `clc1_p_1_101.pdf` (etc. for other page/stage numbers)
  8. Repeat steps 4-7 with the pages from 102..208
  9. In the same directory that you saved the PDFs, run `./assemble.sh 1`
     (the `1` signifies stage number)

Do the same for other stage numbers. Note that the last step might take some
time.
