function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers

  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg

  % TODO: cost_function implementation

  % TODO1: get Theta1 and Theta2 (from params). Hint: reshape

  % TODO2: Forward propagation

  % TODO3: Compute the error in the output layer and perform backpropagation

  % TODO4: Determine the gradients

  % TODO5: Final J and grad

  %am implementat formulele din suportul de tema

  %TODO1

  theta_size = hidden_layer_size * (input_layer_size + 1);

  Theta1 = reshape(params(1:theta_size),
    hidden_layer_size, (input_layer_size + 1));


  Theta2 = reshape(params(theta_size + 1:end),
    output_layer_size, (hidden_layer_size + 1));

  %TODO2
  X = [ones(size(X, 1), 1), X];
  m = size(X, 1);

  z2 = X * Theta1';
  a2 = sigmoid(z2);
  a2 = [ones(size(a2, 1), 1), a2];

  z3 = a2 * Theta2';
  a3 = sigmoid(z3);

  %TODO3
  I = eye(output_layer_size);
  Y = I(y, :);

  %TODO5 putin din el
  cost = -Y .* log(a3) - (1 - Y) .* log(1 - a3);

  J = (1 / m) * sum(sum(cost));
  %TODO4
  Sum_Theta1 = sum(sum(Theta1(:, 2:end) .^ 2));
  Sum_Theta2 = sum(sum(Theta2(:, 2:end) .^ 2));
  Sum = lambda / (2 * m) * (Sum_Theta1 + Sum_Theta2);
  J = J + Sum;

  delta3 = a3 - Y;
  delta2 = (delta3 * Theta2(:, 2:end)) .* sigmoidGradient(z2);

  Delta1 = delta2' * X;
  Delta2 = delta3' * a2;

  Theta1_grad = Delta1 / m;
  Theta2_grad = Delta2 / m;

  Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + (lambda / m) * Theta1(:, 2:end);
  Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + (lambda / m) * Theta2(:, 2:end);

  %TODO5 final
  grad = [Theta1_grad(:); Theta2_grad(:)];

end
function g = sigmoidGradient(z)
  gz = sigmoid(z);
  g = gz .* (1 - gz);
end
