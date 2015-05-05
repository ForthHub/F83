.PO 3

	WELCOME TO FORTH  

     This   is  a  public  domain  system,   and  may  be  freely 
distributed and copied,  as long as the authors are given  credit 
and  no copyright notice is placed upon it.  If we catch  someone 
selling this system as their own proprietary product,  with their 
copyright notice , we will do our best to make them regret it for 
the  rest  of their lives.  You have been  warned!! 	

     This  Forth  uses the files of the  host  operating  system. 
Although  this reduces performance,  it is much more portable and 
more convenient for novices.  The use of files will be  described 
later.

     This  disk contains some Huffman encoded files.  They  allow 
the  system  to fit on one floppy disk.   Your first task  is  to 
expand  them  into the source files for the system.  The  Huffman 
files and their expansions are: 

M86.HUF        -->       META86.BLK
K86.HUF        -->       KERNEL86.BLK 
E86.HUF        -->       EXTEND86.BLK
C86.HUF        -->       CPU8086.BLK

UT.HUF         -->       UTILITY.BLK
HF.HUF         -->       HUFFMAN.BLK
CK.HUF         -->       CLOCK.BLK
FX.HUF         -->       F83-FIXS.TXT

In addition there are a few non-compressed files.   These are the 
following:

README.PC     This file which you are hopefully reading.
RUNME.COM     The file that you will run to create the BLK files.
EXPAND86.BLK  The file used to expand the HUF files.

     In  order  to recover the actual source  code,  simply  type 
RUNME  and  follow  the  directions.    If  all  goes  well,  the 
corresponding  BLK files will be created.   You should of  course 
make  backup  copies of the expanded source code as  soon  as  it 
exists.   We apologize for the time the expansion takes, but such 
is life.   You are now in a position to modify and regenerate the 
system.

     To  do  so,  you should put META86.BLK and  KERNEL86.BLK  on 
drive B:, and put F83.COM on drive A:. Make sure there is room on 
A:  for the new KERNEL.COM,  then log onto drive B:  and type the 
following:

B>A:F83 META86.BLK ( run F83 on META86.BLK )
OK ( loads meta compiler and generates KERNEL.COM )
BYE ( return to CP/M )

     Now you have a new KERNEL.COM on A: and you are ready to add Šthe selected extensions and make a new F83.COM ( you did back  up 
the  old one didn't you?).  Put  EXTEND86.BLK,  CPU8086.BLK,  and 
UTILITY.BLK on A: with KERNEL.COM and type the following:

A>KERNEL EXTEND86.BLK ( run KERNEL86 on EXTEND86.BLK )
OK ( loads all extensions and creates new version of F83.COM )
BYE ( return to CP/M )

You  can have a printout of these instructions by using Control P 
and entering TYPE README.86

     In  what  follows  the <CR> symbol represents  the  carriage 
return  key  on  your terminal.  To enter  Forth  from  the  CP/M 
environment,  insert  the  disk containing the F83.COM file  into 
drive A of your computer,  (after booting it of course) and  type 
F83<CR>

     Forth will reply with:

8086 Forth 83 Model 2.0.0
Modified 01Apr84

     Forth  is about ten years old now (in 1983) but some of  the 
features  of F83 are relatively new to this Public  Domain  Forth 
Model.
  
     The VIEW command is one of the best.  VIEW <word> <CR>  will 
find  the screen that contains the code for the <word>,  provided 
that  the  file that contains <word> is on the  currently  logged 
disk  drive.  If you can fit all of the source code on  a  single 
drive,  VIEW works great,  and takes care of opening the file and 
displaying  the screen for you.   A recent addition to the system 
is the word FIX which combines the function of VIEW with that  of 
the  editor.   To use it type FIX <word> <CR> and the screen upon 
which that word resides will be made available for editing,  with 
the editing cursor placed following the first occurance of <word> 
on that screen.  

     We  have  also  tried to make extensive use  of  the  shadow 
screen  concept.  In this regard,  the word A moves you from  the 
current  screen  to  its associated  shadow  screen.  The  SHADOW 
vocabulary  contains  a  bunch  of  words  that  are  helpful  in 
maintaining  shadow screens.  COPY allows you to copy not only  a 
screen,  but also its associated shadow.  SHOW allows you to list 
each  source screen across from its shadow when you want to print 
them.  Finally  CONVEY allows you to move groups of  screens  and 
their  associated  shadows.  To see what words are in the  SHADOW 
vocabulary simply type SHADOW WORDS<CR>

     There  is  also  a decompiler  present  which  reverses  the 
compiling  process,  producing source code from object code.  The 
user  interface to it is the word SEE <name> where <name> is  the 
name of a Forth word you wish to decompile. While the information 
SEE gives you is not as complete as that given by VIEW,  a  least 
it is always available, and not dependent upon whether or not the Šcorrect file is present on the currently logged disk drive. For a 
real  experience  try decompiling the words STATUS,  which  is  a 
DEFERred  word,   ie  an  execution  vector.   SEE  calls  itself 
recursively in this case and tracks down the definition. This can 
be quite handy.

     To  see a list of the words that are in the dictionary  type 
WORDS. You will see lots of words. Each is a command and each can 
be VIEWed.  WORDS will stop if you hit any key.  You can look  at 
the word SHOW by typing VIEW SHOW.  Assuming all is well you will 
see  a Forth screen containing the definition of SHOW along  with 
some other words. Type A L (cr) and you will be rewarded with the 
Shadow screen that goes with it. A L (cr) will Alternate List you 
back to the original screen of code.  Look at it and when you see 
a word that doesn't seem fully self evident, VIEW it and read the 
shadow  screen.  The  word SHOW and its source code that we  have 
been viewing,  is a command that prints out three source  screens 
along  with  three shadows for a total of six screens  per  page. 
There  are  two  versions  of SHOW.  The vocabulary  you  are  in 
determines  how  SHOW will print out.  If you are in  the  SHADOW 
vocabulary,  six screens of code and shadows will print.  If  you 
are in FORTH 6 screens of code will be printed.

     Now for some more commands.  N is next screen and L is list. 
N L lists the next screen and B L lists the next screen  back.  N 
ED will edit the next screen etc. Now lets printout a few screens 
that  will  detail  some of the editor commands.  Most  are  from 
Starting Forth but some are new ones.

Type this: EDITOR VIEW JOIN<CR>

     You are looking at a screen of editing commands.  Lets go to 
the shadow with the A L command and do some exploring.  While  we 
are  in  the  shadows lets look at the next five  or  six  shadow 
screens  that  should be editor words.  Use N L.  If you  have  a 
printer  you  may print these screens now as follows.  Type  VIEW 
WIPE  for example.  If wipe is the first of 6 screens  of  editor 
words remember the screen number.  If for instance it was 80 then 
type 80 85 SHADOW SHOW<CR>

     Now  a  brief word about our mass  storage  interface.   Our 
Forth  83 system runs as a guest under a host system's  operating 
system.   Because  of  this,  we use the host's  file  system  to 
contain  our screen files.   Screens are implemented as 1K blocks 
within  a random access file.   Screens are still treated  as  16 
lines  of 64 characters when editing,  with no embedded  carriage 
returns or line feeds.   In order to access a screen file it must 
first be opened.   This can be done in two ways.  The most common 
is  to  specify the name of the screen file on the execute  line.  
Thus  if you wanted to open MY.BLK you could fire up  Forth  with 
the following:

A>F83 MY.BLK<CR>
.paŠOnce  you are in Forth,  you can open other files with the  Forth 
word OPEN <name> where <name> is the name of the file you wish to 
open.   OPEN is a defining word,  and creates a dictionary  entry 
using the file name.   Once a file is opened BLOCK references are 
relative  to the beginning of the currently open file.   After  a 
file  has been opened with OPEN,  it may be reopened by executing 
the  file  name.   This is very fast,  since only  a  pointer  is 
changed  in  memory.   One note,  block 0 is still treated  as  a 
special case, and hence can't be loaded.

                         FORTH EXAMPLES

     We  would  like to answer some of the most frequently  asked 
questions  about the F83 system at this point.   The best way  to 
gain familiarity with the system is to fire it up and try out the 
following examples.   We will indicate the text that you type  in 
as upper case text.   The text in parentheses are our comments on 
what is going on.  The <CR> indicates carriage return, as usual.

F83<CR> ( fire up forth from the CP/M environment )
8086 Forth 83 Model 2.0.0 ( Forth's reply and )
Modified 01Apr84          ( sign on message )
WORDS<CR>
empty mark hello ....
10 CREATE-FILE SAMPLE.BLK<CR> ( Creates a file called SAMPLE.BLK )
                              ( which is 10 screens big. )
1 LIST<CR>
Scr# 1
  0
  1
  2      ( This will be a blank screen )
  ...
 15

( Now we will edit screen 1 with the default dumb terminal )
( editor which is pre-installed for you.  Your first task is )
( to install the cursor addressing routines to make the editor )
( more convenient to use )

1 EDIT<CR>
Enter your id: ..........   
   ( Your id is a 10 character string that will automatically )
   ( be placed in the upper right hand corner of line 0 of the )
   ( current screen you are editing if you modify that screen )
   ( I usually enter the date and my initials as follows: )
10MAR84HHL<CR>
   ( The screen will be blanked and listed, you should have )
   ( a result similar to 1 LIST above,  but with the line ) 
   ( number also appearing on the right hand side of the screen )

   ( Now we will enter the source code necessary to install )
   ( the cursor routine drivers for an ADM-3A terminal )
.paŠ0 NEW<CR> 
   ( This allows us to enter multiple lines of text.  The text )
   ( input is terminated with a null line.  After each line is )
   ( entered, it is redisplayed for you )
\ CURSOR ROUTINES FOR AN ADM-3A TERMINAL<CR>
   ( it is best to use line 0 for a comment )
EDITOR DEFINITIONS<CR> 
   ( This will add the following definitions to the editor )
: ADM-AT<CR>
   27 EMIT  ASCII = EMIT   32 + EMIT   32 + EMIT  ;<CR>
: ADM-DARK<CR>
   CONTROL Z EMIT   ;<CR>
: ADM-3A<CR>
   ['] .ALL      IS  .SCREEN <CR>
   ['] ADM-AT    IS  AT <CR>
   ['] ADM-DARK  IS  DARK <CR>
   ['] NOOP      IS  -LINE <CR>
   ['] (BLOT)    IS  BLOT ; <CR>
ADM-3A <CR>
<CR>
DONE<CR>
1 modified
   ( Typing that last <CR> will return you to Forth. The DONE )
   ( command will write the text you entered to the disk, and )
   ( exit from the editing environment )
   ( To install the ADM-3A drivers you need now just type: )
1 LOAD<CR>
   ( Now the editor will work the way it was intended to )
   ( with the current screen image always displayed at the )
   ( top of the screen, and the line you are entering at the )
   ( bottom of the screen.  To make sure type: )
1 EDIT<CR>
   ( The screen should be blanked, and the text you just )
   ( entered will be displayed at the top of the screen. )
   ( The current line will be displayed at the bottom of the )
   ( screen with a ^ pointing to the current editing cursor )
   ( position.  The terminal's cursor will be below the ) 
   ( line, and ready for an editing command. )
DONE<CR>
1 Unmodified
   ( Will again leave the editor and return to Forth )
   ( Now we will save the system and leave Forth )
SAVE-SYSTEM F.COM<CR>
   ( That will save the current system as a file called )
   ( F.COM on the currently logged drive. )
BYE<CR>
   ( This exits Forth and returns to CP/M.  Now if you use )
   ( F.COM instead of F83.COM you will have your terminal )
   ( routines installed at boot up time. )
.paŠ     Note  that  the  above routines are designed for  an  ADM-3A 
terminal,  and  will not work if your terminal is not an  ADM-3A.  
You  will  have to consult your terminal manual for  the  correct 
escape  sequences  required in order to position the  cursor  and 
implement the other special functions required.   A better way to 
do  the  above  is to recompile  the  entire  system,  with  your 
terminal  routines  installed as the default instead of the  DUMB 
terminal  routines  supplied  with  the  system.    In  order  to 
accomplish this you should copy the screen you just entered  into 
the UTILITY.BLK file and recompile the system as described above.  
The  following  illustrates how to do this,  using the  multifile 
utility words implemented in F83.

F83 UTILITY.BLK<CR>
   ( files up F83 and opens UTILITY.BLK as the default file.  )
   ( Make sure that UTILITY.BLK is on the currently logged )
   ( drive )
   ( Now find a blank or irelevant screen at the end of the )
   ( editors set of screens, on top of which we are going to )
   ( put the screen we just entered.  Suppose it is screen )
   ( number 32.  You should now type: )
FROM SAMPLE.BLK 1 32 COPY<CR>
   ( This will copy screen 1 from SAMPLE.BLK to screen 32 of )
   ( the current file.  Note that SAMPLE.BLK must also be on )
   ( the currently logged drive. )
   ( You can now recompile the high level portion of the )
   ( by leaving Forth and typeing the following: )
BYE<CR>   ( leave Forth )
KERNEL EXTEND86.BLK<CR>
START<CR>
   ( Of course all of the necessary files should be present )
   ( on the currently logged drive in order for this to work )


     If  you  are new to Forth your best bet is to  purchase  the 
book  STARTING  FORTH  by LEO BRODIE.  It costs  about  seventeen 
dollars  and is available at most large book stores.  On page  84 
you will find the commands for the line editor.  Another valuable 
reference is the new book by MARTIN TRACY called FORTH TOOLS.  It 
is  available from MicroMotion,  12077 Wilshire Blvd.  Suite 506, 
West Los Angeles,  CA 90025.   The price for the book is  $20.00.  
The F83 model follows both the book and the Forth 83 standard. 

     The Forth Interest Group ( FIG ) has chapters in many areas. 
In  the  San  Francisco Bay Area,  meetings are held on  the  4th 
Saturday of each month,  currently at Chabot College in  Hayward, 
CA.  Call  the  FIG  hot  line if you wish to  double  check  the 
location ph 962-8653 or the FIG Tree BBS (300 baud) at 538-3580.


Henry Laxen                                  Mike Perry
1259 Cornell Avenue                          1125 Bancroft Way
Berkeley, CA 94706                           Berkeley, CA 94702
.paŠ
             System Memory Map  
     The  memory map will vary somewhat with CPU,  and  operating 
system,  and  options.  For CP/M on the 8080 with 64K of  memory, 
with four block buffers and all utilities,  it is as  follows:  ( 
all addresses in hexadecimal)

     0100      Jump to cold start
     0104      Jump to warm start
     0108 ----

               Dictionary with all utilities loaded.

     5E75 ---- HERE

               Free space.

     D10E ---- SP0, TIB

               | Text Input Buffer
               V
                            ^
               Return Stack |

     D1D6 ---- RP0, >BUFFERS

               Block Buffer Pointer Table

     D200 ---- FIRST

               Block Buffers

     E200 ---- LIMIT


.PAŠ             Standard System Documentation Requirement

1.  The  system  dictionary space is CPU  dependant  and  can  be 
determined by typeing HERE U. <CR>

2. The application dictionary space is also CPU dependant and  is 
the  difference  between  the  top  of  the  dictionary  and  the 
beginning of the parameter stack.  The location of the  parameter 
stack  varies depending on the amount of memory available to  the 
machine.   The application dictionary space can be determined  by 
typing SP@ HERE - U. <CR>

3. The data stack space is the same as the dictionary space.

4.  The return stack space was arbitrarily set at 256 bytes.   It 
can be altered by remeta-compiling the system.

5.  No  mass  storage block ranges are reserved  by  the  system, 
other than the contents of the files that are distributed.

6. The user has available to him blocks 0 thru 65534.  Note  that 
block  0  may  not be used for loading.  Block  number  65535  is 
reserved to indicate the buffer is missing.

7. Any ascii terminal should work with this system.  If the  user 
has  a  cursor  addressable terminal, the editor  can  be  easily 
modified to take advantage of the terminal's characteristics.

8. System action taken upon error conditions:

     ' <name> ['] <name>  not found results in ? error message
     
     */ */MOD / /MOD MOD UM/MOD  all division by 0 errors  result      
     in a 0 quotient

     : in the case of an error, a ? error message will be printed

     DO if a nesting error occurs, the system will crash. (if you 
     are lucky)

     EXECUTE  if  addr is not a compilation address,  the  system 
     will crash. see DO

     EXIT if the top of the return stack does not contain a valid 
     return point, the system will crash.  see DO

     FORGET <name>  if <name> is not found, a ? error message  is 
     printed.   If the compilation vocabulary is  forgotten,  the 
     system will crash. see DO

     FORTH-83  if the error condition occurs,  that this is not a  
     standard  system,  I don't want to hear about it and I  hope 
     the system not only crashes, but burns.

     LOAD if u is zero, the system will crash.  see DOŠ