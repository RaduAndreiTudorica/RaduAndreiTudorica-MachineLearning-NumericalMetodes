function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix

	% path -> the states chosen by the algorithm

  % TODO: heuristic_greedy implementation

  %codul implementat dupa pseudocodul din suportul temei

  len = length(probabilities);
  path = start_position;
  visited = sparse(len, 1);
  visited(start_position) = 1;
  win = len - 1;

  while ~isempty(path)
    position = path(end);

    if position == win
      return;
    endif

    neigh = find(Adj(position, :));
    unvisited = neigh(~visited(neigh));

    if isempty(unvisited)
      path(end) = [];
    else
      [~, best_idx] = max(probabilities(unvisited));
      next_pos = unvisited(best_idx);

      path(end + 1) = next_pos;
      visited(next_pos) = 1;
    end
  endwhile
end
