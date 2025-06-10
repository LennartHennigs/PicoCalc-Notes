' Matrix Effect for PicoCalc - L.Hennigs 06/2025

option base 1
option explicit

const w = 40
const h = 25
const trail_l = h\2
const trail_min = 4
const trail_area = h\2
const chr_w = mm.info(fontwidth)
const chr_h = mm.info(fontheight)

const c_head = rgb(0, 255, 0)
const c_tail = rgb(0, 180, 0)

dim p(w), t(w), col_x(w)
dim i, x, y, clr_y

function rnd_chr$()
  rnd_chr$ = chr$(int(rnd() * 90 + 33))
end function

sub new_trail(index)
  p(index) = int(rnd() * trail_area)
  t(index) = int(rnd() * trail_l) + trail_min
end sub

sub matrix
  randomize timer
  cls
  ' init cols and calculate x pos
  for i = 1 to w
    col_x(i) = (i - 1) * chr_w
    new_trail(i)
  next i
  ' iterate over cols
  do while inkey$ = ""
    for i = 1 to w
      ' for all cols
      x = col_x(i)
      y = p(i) * chr_h

      ' new random char
      if p(i) < h then
        color c_tail
        print @(x, y - chr_h) rnd_chr$()
        if p(i) + 1 < h then
          color c_head
          print @(x, y) rnd_chr$()
        endif
      endif

      ' delete char at tail
      clr_y = (p(i) - t(i)) * chr_h
      if clr_y >= 0 and clr_y < h * chr_h then
        print @(x, clr_y) " "
      endif

      ' increase y pos
      p(i) = p(i) + 1

      ' reset trail if done
      if (p(i) - t(i)) >= h then
        new_trail(i)
      endif
    next i
  loop
  ' clean up
  cls
  color c_head
end sub

' --- main

matrix
