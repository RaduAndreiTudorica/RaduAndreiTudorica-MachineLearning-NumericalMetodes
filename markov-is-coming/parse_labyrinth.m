function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits

  % Labyrinth -> the matrix of all encodings for the labyrinth's walls

  % TODO: parse_labyrinth implementation

  file = fopen(file_path, "r");

  m = fscanf(file, '%d', 1);
  n = fscanf(file, '%d', 1);

  Labyrinth = fscanf(file, '%f', [n m]);
  Labyrinth = Labyrinth';

  fclose(file);
end
