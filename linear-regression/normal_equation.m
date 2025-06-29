function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights

  % TODO: normal_equation implementation

  %cod implementat cu ajutorul pseudocodului din laborator

  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;

  r = b;
  p = r;
  Theta = zeros(size(b));
  rr = r' * r;

  i = 1;
  while i <= iter
    Ap = A * p;
    pap = p' * Ap;
    alpha = rr / pap;

    Theta = Theta + alpha * p;
    r = r - alpha * Ap;

    if norm(r) < tol
      break;
    end

    new_rr = r' * r;
    beta = new_rr / rr;
    p = r + beta * p;
    rr = new_rr;

    i = i + 1;
  end
  Theta = [0; Theta];
end
