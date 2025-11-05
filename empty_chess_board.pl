% Draws a character for n times
% Draws the chess board with empty cells and labels
drawSymbol(Symbol, 0). % Base case: do nothing when N is 0
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1). % Recursive case

% Draws the borders of the chess board
% Draws the border line recursively
drawBorderLine(0) :- drawSymbol('+', 1), nl. % Base case
drawBorderLine(Col) :- % Recursive case
  Col > 0, % Check if there are more columns to draw
  drawSymbol('+', 1), drawSymbol('-', 4), % Draw border for one cell
  NewCol is Col - 1, % Decrement column count
  drawBorderLine(NewCol). % Recursive case

% Draws the cells where we will have the chess pieces
% Draws the content cells recursively
drawContentCell(Row, 0) :- drawSymbol('|', 1), nl. % Base case
drawContentCell(Row, Col) :- % Recursive case
  Col > 0, % Check if there are more columns to draw
  drawSymbol('|', 1), drawSymbol(' ', 4), % Draw empty cell
  NewCol is Col - 1, % Decrement column count
  drawContentCell(Row, NewCol). % Recursive case

% Does the numbering of cells at the bottom of the board
% Draws the column labels at the bottom of the board
drawPair :- % Draw the bottom border and column labels
  drawSymbol(' ', 4), drawSymbol('a', 1), drawSymbol(' ', 4), drawSymbol('b', 1), % Draw column labels
  drawSymbol(' ', 4), drawSymbol('c', 1), drawSymbol(' ', 4), drawSymbol('d', 1), % Draw column labels
  drawSymbol(' ', 4), drawSymbol('e', 1), drawSymbol(' ', 4), drawSymbol('f', 1), % Draw column labels
  drawSymbol(' ', 4), drawSymbol('g', 1), drawSymbol(' ', 4), drawSymbol('h', 1). % Draw column labels

% Draw the board rows recursively 
% Draws the entire chess board
% The rule to draw the board
drawBoard(0, Col) :- drawSymbol(' ', 1), drawBorderLine(Col), drawPair. % Base case draw empty space, borderline, and column numbers
drawBoard(Row, Col) :-  % 4 spaces a, then 4 spaces b, ..., then 4 spaces h
  Row > 0, % Recursive case
  drawSymbol(' ', 1), % Draw the left border 
  drawBorderLine(Col), % Draw the top border
  drawSymbol(Row, 1), % Draw the row number
  drawContentCell(Row, Col), % Draw the content cells
  NewRow is Row - 1, % Decrement the row number
  drawBoard(NewRow, Col). % Recursive call

main :- drawBoard(8, 8). % Entry point