function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%
 
  % Cost
  prediction = X * Theta';
  variance = (prediction .- Y) .^ 2 ;
  %Regularization
  regThetaCost = (lambda/2.0) * sum(sum(Theta.^2));
  regXCost = (lambda/2.0) * sum(sum(X.^2));
  
  J = (1/2) * sum( sum(R .* variance)) + regThetaCost + regXCost;
  
  

  
  % Gradients
  
  
    % Gradients  - Vectorized
    
      Error_Matrix = R .* ((X * Theta') - Y); 
      X_grad     = (Error_Matrix * Theta)  +  (lambda * X);    
      Theta_grad = (Error_Matrix' * X)     +  (lambda * Theta);    
    
    
    
    
    
 %  ADD REGULARIZATION ...
 
    
            %for i = 1 : num_movies
            % Course suggestion .....
            %idx = find(R(i,:) == 1);
            %Theta_tmp = Theta(idx,:);
            %Y_tmp = Y(i,idx);
            %X_grad = ( X(i,:) * Theta_tmp' - Y_tmp) * Theta_tmp
            
            % VJ implementation ... 
            % XI = X(i,:); % 1 X num_features
            % YI = Y(i,:); % 1 X num_users
            % Xsum =  R(i,:) .* ((XI * Theta') - YI ); 
            % X_grad(i,:) =  ( Xsum * Theta);
            %end
      
      
      
           %for j = 1 : num_users
           % YJ = Y(:,j); % num_movies X 1
           % ThetaJ = Theta(j,:);  % 1 X num_features
           % X is num_movies X num_features          
           % Theta_sum =  R(:,j) .* ((X * ThetaJ') - YJ ); 
           % Theta_grad(j,:) =  ( Theta_sum' * X);
           % end
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOOP IMPLEMENTATION 
     
          % X_grad = [num_movies = i] X [num_features = 3]
          %for i = 1 : num_movies
          % Xsum = zeros(1,size(X,2));
          % for j = 1 : num_users
          %     if ( R(i,j) == 1 )
          %     %     Xsum = Xsum + ( ( Theta(j,:) * X(i,:)' ) - Y(i,j) ) * Theta(j,:);
          %     end 
          % end 
          %  X_grad(i,:) = Xsum; 
          % end
 
 
          % Theta_grad = [num_users = j] X [num_features = 3]
          %for j = 1 : num_users
          % Theta_sum = zeros(1,size(Theta,2));
          % for i = 1 : num_movies
          %     if ( R(i,j) == 1 )
          % Theta_sum = Theta_sum + ( ( Theta(j,:) * X(i,:)' ) - Y(i,j) ) * X(i,:);
          %     end 
          % end 
          %Theta_grad(j,:) = Theta_sum; 
          %end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

  

  
  
% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
