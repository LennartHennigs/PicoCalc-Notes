' 45 degree pixel rain
' inspired by appendix_pi @ instagram
' LH – 06/25

option base 1
option explicit

randomize timer

const DROPS = 100
const TRAIL_LEN = 60
const HEAD_COL = rgb(0, 255, 0)
const TAIL_COL = rgb(0, 128, 0)

dim x(DROPS), y(DROPS), length(DROPS)
dim i

sub init_drop(index)
  x(index) = int(rnd() * 320)
  y(index) = int(rnd() * 320)
  length(index) = int(rnd() * TRAIL_LEN) + 10
end sub

for i = 1 to DROPS
  init_drop(i)
next i

sub rain
  do while inkey$ = ""
    for i = 1 to DROPS

      if length(i) > 0 and x(i) < 320 and y(i) < 320 then
        pixel x(i), y(i), TAIL_COL

        x(i) = x(i) + 1
        y(i) = y(i) + 1
        length(i) = length(i) - 1

        if x(i) < 320 and y(i) < 320 then
          pixel x(i), y(i), HEAD_COL
        endif
      else
        init_drop(i)
      endif

    next i
  loop
end sub

list 
rain
cls
