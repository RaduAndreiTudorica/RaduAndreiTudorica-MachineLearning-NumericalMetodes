function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values

  epsilon = sqrt(6) / sqrt(L_prev + L_next);

  rand_matrix = rand(L_next, L_prev + 1);
  rand_matrix = rand_matrix * 2 - 1;
  matrix = rand_matrix * epsilon;

end
