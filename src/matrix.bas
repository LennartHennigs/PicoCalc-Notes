' Matrix Effect - LH 06/2025

option base 1
option explicit

const W = 40
const H = 25
const TRAIL_L = H\2
const TRAIL_MIN = 4
const TRAIL_AREA = H\2
const CHR_W = mm.info(fontwidth)
const CHR_H = mm.info(fontheight)

const HEAD_C = rgb(0, 255, 0)
const TAIL_C = rgb(0, 180, 0)

dim p(W), t(W), col_x(W)
dim i, x, y, clr_y

sub new_trail(index)
  p(index) = int(rnd() * TRAIL_AREA)
  t(index) = int(rnd() * TRAIL_L) +   TRAIL_MIN
end sub

function rnd_chr$()
  rnd_chr$ = chr$(int(rnd() * 90 +   33))
end function

sub matrix
  randomize timer
  cls
  ' init cols and calculate x pos
  for i = 1 to W
    col_x(i) = (i - 1) * CHR_W
    new_trail(i)
  next i
  ' iterate over cols
  do while inkey$ = ""
    for i = 1 to W
      ' for all cols
      x = col_x(i)
      y = p(i) * CHR_H

      ' new random char
      if p(i) < H then
        color TAIL_C
        print @(x, y - CHR_H)   rnd_chr$()
        if p(i) + 1 < H then
          color HEAD_C
          print @(x, y) rnd_chr$()
        endif
      endif

      ' delete char at tail
      clr_y = (p(i) - t(i)) * CHR_H
      if clr_y >= 0 and clr_y < H *   CHR_H then
        print @(x, clr_y) " "
      endif

      ' increase y pos
      p(i) = p(i) + 1

      ' reset trail if done
      if (p(i) - t(i)) >= H then
        new_trail(i)
      endif
    next i
  loop
  ' clean up
  cls
  color HEAD_C
end sub

' --- main

matrix
