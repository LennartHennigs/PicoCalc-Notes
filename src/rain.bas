' 45 degree pixel rain
' inspired by appendix_pi @ instagram
' LH – 06/25

OPTION BASE 1
OPTION EXPLICIT

RANDOMIZE TIMER

CONST DROPS = 100
CONST TRAIL_LEN = 60
CONST HEAD_COL = RGB(0, 255, 0)
CONST TAIL_COL = RGB(0, 128, 0)

DIM x(DROPS), y(DROPS), length(DROPS)
DIM i

SUB init_drop(index)
  x(index) = INT(RND() * 320)
  y(index) = INT(RND() * 320)
  length(index) = INT(RND() * TRAIL_LEN) + 10
END SUB

FOR i = 1 TO DROPS
  init_drop(i)
NEXT i

SUB rain
  DO WHILE INKEY$ = ""
    FOR i = 1 TO DROPS

      IF length(i) > 0 AND x(i) < 320 AND y(i) < 320 THEN
        PIXEL x(i), y(i), TAIL_COL

        x(i) = x(i) + 1
        y(i) = y(i) + 1
        length(i) = length(i) - 1

        IF x(i) < 320 AND y(i) < 320 THEN
          PIXEL x(i), y(i), HEAD_COL
        ENDIF
      ELSE
        init_drop(i)
      ENDIF

    NEXT i
  LOOP
END SUB

LIST 
rain
CLS
