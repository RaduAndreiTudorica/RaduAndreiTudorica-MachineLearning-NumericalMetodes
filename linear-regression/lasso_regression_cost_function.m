function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation

  %implementarea formulei din suportul temei
  [m, ~]= size(FeatureMatrix);
  Zero = sparse(m, 1);
  FeatureMatrix = [Zero, FeatureMatrix];

  h = FeatureMatrix * Theta;
  Error = sum((Y - h) .^ 2) / m + lambda * sum(abs(Theta));

end
