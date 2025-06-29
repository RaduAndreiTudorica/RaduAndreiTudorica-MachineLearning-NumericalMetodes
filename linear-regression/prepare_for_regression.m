function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples

  % TODO: prepare_for_regression implementation
  [m, n] = size(InitialMatrix);
  FeatureMatrix = sparse(m, n + 1);

  k = 1;

  for j = 1 : n
    x = InitialMatrix{1, j};
    is_furnish_column = (strcmp(x, 'furnished') || strcmp(x, 'semi-furnished') || strcmp(x, 'unfurnished'));
    %daca sunt pe coloana cu furnished atunci codez coloana in 2 cu 1 si 0 conform cerintei
    if is_furnish_column
      for i = 1:m
        val = InitialMatrix{i, j};
        if strcmp(val, 'semi-furnished')
          FeatureMatrix(i, k) = 1;
          FeatureMatrix(i, k + 1) = 0;
        elseif strcmp(val, 'unfurnished')
          FeatureMatrix(i, k) = 0;
          FeatureMatrix(i, k + 1) = 1;
        elseif strcmp(val, 'furnished')
          FeatureMatrix(i, k) = 0;
          FeatureMatrix(i, k + 1) = 0;
        end
      end
      k = k + 2;
    else
      for i = 1:m
        val = InitialMatrix{i, j};
        if isnumeric(val)
          FeatureMatrix(i, k) = val;
        elseif ischar(val)
          num = str2double(val);
          if ~isnan(num)
            FeatureMatrix(i, k) = num;
          elseif strcmp(val, 'yes')
            FeatureMatrix(i, k) = 1;
          elseif strcmp(val, 'no')
            FeatureMatrix(i, k) = 0;
          end
        end
      end
      k = k + 1;
    end
  end
end
