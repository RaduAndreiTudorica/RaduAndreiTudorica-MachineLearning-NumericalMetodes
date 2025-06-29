function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Link -> the link matrix associated to the given labyrinth

  % TODO: get_link_matrix implementation

  Adj = get_adjacency_matrix(Labyrinth);
  Link = Adj;

  [m, n] = size(Link);

  for i = 1 : m
    s = sum(Link(i, :));
    if s ~= 0
      Link(i, :) = Link(i, :) / s;
    endif
  endfor
  Link = sparse(Link);
end
