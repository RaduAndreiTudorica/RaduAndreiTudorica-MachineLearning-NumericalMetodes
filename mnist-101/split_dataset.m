function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset

  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels

  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  % TODO: split_dataset implementation

  [m, ~] = size(X);

  p = randperm(m);

  X_shuffled = X(p, :);
  y_shuffled = y(p);

  m_percent = round(percent * m);

  X_train = X_shuffled(1 : m_percent, :);
  X_test = X_shuffled(m_percent + 1 : end, :);

  y_train = y_shuffled(1 : m_percent, :);
  y_test = y_shuffled(m_percent + 1 : end, :);

end
