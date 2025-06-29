function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Adj -> the adjacency matrix associated to the given labyrinth

  % TODO: get_adjacency_matrix implementation

  [m, n] = size(Labyrinth);

  Adj = sparse(m * n + 2, m * n + 2);
  %pozitiile starilor de win si lose in matrice
  win_index = m * n + 1;
  lose_index = m * n + 2;

  for i = 1 : m
    for j = 1 : n
      %trecerea din 2d in 1d ca la info la grafuri
      current_index = (i - 1) * n + j;
      value = Labyrinth(i, j);

      %primele 2 if uri verifica starile de win si lose
      if (i == 1 && bitand(value, 8) == 0) || (i == m && bitand(value, 4) == 0)
        Adj(current_index, win_index) = 1;
      endif
      if (j == 1 && bitand(value, 1) == 0) || (j == n && bitand(value, 2) == 0)
        Adj(current_index, lose_index) = 1;
      endif
      if i > 1 && bitand(value, 8) == 0
        north_index = (i - 2) * n + j;
        Adj(current_index, north_index) = 1;
      endif
      if i < m && bitand(value, 4) == 0
        south_index = i * n + j;
        Adj(current_index, south_index) = 1;
      endif
      if j < n && bitand(value, 2) == 0
        east_index = (i - 1) * n + (j + 1);
        Adj(current_index, east_index) = 1;
      endif
      if j > 1 && bitand(value, 1) == 0
        west_index = (i - 1) * n + (j - 1);
        Adj(current_index, west_index) = 1;
      endif
    endfor
  endfor

  Adj(win_index, win_index) = 1;
  Adj(lose_index, lose_index) = 1;
end
