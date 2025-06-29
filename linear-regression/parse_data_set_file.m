function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_data_set_file implementation

  file = fopen(file_path, 'r');

  m = fscanf(file, '%d', 1);
  n = fscanf(file, '%d', 1);
  line = fgetl(file);

  InitialMatrix = cell(m, n);

  i = 1;
  %citesc fiecare linie si tokenizez fiecare cuvant
  while i <= m
    line = fgetl(file);

    while length(strsplit(line)) < n
      line = [line ' ' fgetl(file)];
    endwhile

    tokens = strsplit(line);

    for j = 1 : length(tokens);
      InitialMatrix{i, j} = tokens{j};
    endfor

    i = i + 1;

  endwhile

  Y = zeros(m, 1);
  for i = 1:m
    Y(i) = str2double(InitialMatrix{i, 1});
  end

  InitialMatrix(:, 1) = [];

  fclose(file);
end
