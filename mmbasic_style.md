
# MMBasic 6.0.0.2 Style Guide for PicoCalc


**Description**: This guide captures recommended coding conventions and formatting practices for writing clean, consistent, and visually expressive MMBasic code for PicoMite on the PicoCalc. 

**Goal**: Use it to generate, review or format MMBASIC code.

**Reference**: https://geoffg.net/Downloads/picomite/PicoMite_User_Manual.pdf

## Beginning

- Start each file with a descriptive title / short description, followed by date and version

```  MMBASIC
' Matrix Effect
' 06/25, v0.1
```

## Configuration

- Always declare basic settings up front. 
- This is a good practice set:

```  MMBASIC
OPTION BASE 1 		' sets array indexing to start at 1
OPTION EXPLICIT 	' vars must be defined
RANDOMIZE			' initalize random nummber generator
```

- `OPTION BASE` must be declared before any array declarations.
- Use `RANDOMIZE` only if random values are needed.

## Constants

- Use constants instead of magic numbers (e.g. for colors, sizes, limits).
- Define color values explicitly with RGB(...).
- Prefer descriptive names like `HEAD_COL, TRAIL_LEN`.

``` MMBASIC
CONST W = 40
CONST H = 25
CONST HEAD_COL = RGB(0, 255, 0)
```

## Variables

- Use `DIM` for global variables, `LOCAL` or `STATIC` for variables inside SUBs.
- A variable name or a label must not be the same as a command, function or a keyword.
- It is illegal to use the same variable name with different types.
- Always use `OPTION EXPLICIT` and define all variables via `DIM`.
- Short, lowercase names for temporary variables (`i, x, y`), meaningful variable names for others.
- Group related variables using `DIM`, keeping indexing consistent (1-based).
- Floating-point vars are created by default (`x = 3.14`).
- Use `%` suffix for integers if needed for clarity (`count% = 10`).
- Use `!` for floating point variables.
- Strings are denoted by a `$` suffix(`name$ = "Alice"`).

## Functions and Subroutines

- Use snake_case for subroutines and functions (`init_drop`).
- Use `SUB Name(parameters...)` to start a subroutine and `END SUB` to end it.
- Use `EXIT SUB` and `EXIT FUNCTION` to return early when needed.
- Declare all internal variables with `LOCAL` to avoid implicit globals.
- Prefer `LOCAL` over implicit globals to avoid side effects.
- Functions are similar to subs but return a value. Define with `FUNCTION Name(parameters...) [AS Type]` and end with `END FUNCTION`. Inside the function, assign to the function’s name to set the return value.
- Declare return type with `AS <TYPE>` when needed (e.g. `AS INTEGER`).

## Formatting

- Indentation: 2 spaces per block level.
- Consistent spacing around operators and after commas.
- Avoid unnecessary whitespace in logic or function calls.
- Use the single quote `'` to start a comment.
- Prefer multi-line IF structures. Use `ELSE IF` if needed, and `ÈNDIF` to close.

``` MMBASIC
IF x(i) < 320 AND y(i) < 320 THEN
  PIXEL x(i), y(i), HEAD_COL
ENDIF
```

- Avoid ending lines with `;` unless intentionally suppressing newline in `PRINT`.
- Separate logical sections (init, loop, cleanup) with blank lines.

## Program Flow

- Encapsulate logic in subroutines (SUB) for readability.
- Use structured loops (`FOR, DO WHILE, LOOP UNTIL`) instead of manual jumps.
- Use `INIT_*` subroutines to set up arrays, etc.
- Avoid `GOTO` or `GOSUB`; favor structured subs and loops.
- Avoid chaining commands with `:` on the same line. Write one statement per line for clarity.

## Graphics & Output

- The screen is 320x320 pixels, The coordinate system origin is at the top-left corner (0,0)
- Default font is 8×12 pixels, giving 40 columns × 25 lines.
- Use `PRINT @(x, y)` for character positioning if working in text mode.
- Clear screen before and after visual loops using `CLS`.
- Define your own color constants (`CONST Orange = RGB(255,165,0)`) as there are no predefined ones.
- Use `PIXEL x, y, RGB(...)` for graphical output.
- Use `COLOR fg, bg` to set console text color before `PRINT`.
- Avoid relying on scrolling—limit output to fit 25 lines.

## Special Keys

- These can be read via `INKEY$`

	| Key | ASCII Code |
	|--|--|
	| Up	| 128 |
	| Down	| 129 |
	| Left	| 130 |
	| Right	| 131 |
	| F1	| 145 |
	| F2	| 146 |
	| F10	| 154 |

- For PS2 and USB keyboards, if the shift key is simultaneously pressed with the function keys F1 to F12 then 40 (hex) is added to the code

## Execution

- End programs with a clear main block:

``` MMBASIC
rain
CLS
```

- Use END to terminate execution if needed.
