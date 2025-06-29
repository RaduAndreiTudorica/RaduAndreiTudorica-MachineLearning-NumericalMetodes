function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation

  file = fopen(file_path, 'r');
  line = fgetl(file);

  InitialMatrix = {};

  i = 1;
  %citesc fiecare linie si tokenizez fiecare cuvant
  while ~feof(file)
    line = fgetl(file);

    if ischar(line)
      tokens = strsplit(line, ',');

      for j = 1:length(tokens)
        InitialMatrix{i, j} = tokens{j};
      endfor
      i = i + 1;
    endif
  endwhile
  m = size(InitialMatrix, 1);
  Y = zeros(m, 1);
  for i = 1:m
    Y(i) = str2double(InitialMatrix{i, 1});
  end

  InitialMatrix(:, 1) = [];

  fclose(file);

end
