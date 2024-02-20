% [thetahat,xhat,yhat]=rls(y,N,lambda,delay)
%
%	y			- Data sequence
%	N			- Dimension of the parameter vector
%	lambda		- Forgetting factor
%   delay       - Delay of y, used as reference signal in ALE, if delay=0,
%                 this becomes one step ahead prediction
%	thetahat	- Matrix with estimates of theta. 
%				  Row n corresponds to the estimate thetahat(n)'
%   yhat        - Estimate of y (periodic noise)
%	xhat		- Estimate of x (speech)
%
%
%
%  rls: Recursive Least-Squares Estimation
%
% 	Estimator: yhat(n)=Y^{T}(n)thetahat(n-1)
%              xhat = y - yhat
%
%	thetahat is estimated using RLS. 
%
%     
%     Author: Ziyue Yang
%     Date: 2024.02.20

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [thetahat,xhat,yhat] = rls(y,N,lambda,delay)

    % Initialization
    M = length(y);
    Y = zeros(N, M);
    xhat = zeros(M, 1);
    yhat = zeros(M, 1);
    thetahat = zeros(N, M+1);
    K = zeros(N, M);
    P = 10000 * eye(N);

    % Loop
    for n = 1:M

	    % Store the delayed samples of y in Y
        if n > delay
            Y(:, n+1) = circshift(Y(:, n), -1);
            Y(end, n+1) = y(n-delay); 
        end
        
	    % Estimate of noise
        yhat(n) = Y(:, n)' * thetahat(:, n);

        % substract the estimation of noise to acquire speech x
        xhat(n) = y(n) - yhat(n);
        
        % Update K
        K(:, n) = P*Y(:, n) / (lambda + Y(:, n)'*P*Y(:, n));

	    % Update the n+1 row in the matrix thetahat which in the notation in the Lecture Notes
	    % corresponds to thetahat(n)
	    thetahat(:, n+1) = thetahat(:, n) + K(:, n) * xhat(n);

        % Update P
        P = (1/lambda) * (P - K(:, n) * Y(:, n)' * P);

%         rls(linspace(1,10,10)', 5, 1, 0);
%         n
%         Y(:, n)'
%         y(n)
%         yhat(n)

    end
    
    % Shift thetahat one step so that row n corresponds to time n
    thetahat=thetahat(:, 2:M+1);

end