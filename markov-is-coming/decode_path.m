function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns

	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation

  win_index = lines * cols + 1;


  path = path(1 : end - 1);

  %face dintr-o variabila 1d una 2d

  decoded_path = zeros(length(path) , 2);

  for i = 1 : length(path)
    x = path(i);
    decoded_path(i, 1) = floor((x - 1) / cols) + 1;
    decoded_path(i, 2) = mod(x - 1, cols) + 1;
  endfor

end
