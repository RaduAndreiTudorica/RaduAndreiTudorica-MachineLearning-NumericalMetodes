function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation

  %cod adaptat dupa formulele gasite in suportul temei

  [m, ~]= size(FeatureMatrix);
  Zero = sparse(m, 1);
  FeatureMatrix = [Zero, FeatureMatrix];

  Theta = sparse(n + 1, 1);
  for i = 1 : iter
    h = FeatureMatrix * Theta;
    grad = (FeatureMatrix') * (h - Y) / m;
    Theta = Theta - alpha * grad;
  end
end
