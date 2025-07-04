function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation

   %implementarea formulei din suportul temei
  [m, ~]= size(FeatureMatrix);
  Zero = sparse(m, 1);
  FeatureMatrix = [Zero, FeatureMatrix];

  h = FeatureMatrix * Theta;
  Error = sum((h - Y) .^ 2) / (2 * m);
end
