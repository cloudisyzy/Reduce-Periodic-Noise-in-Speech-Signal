% [thetahat,xhat,yhat]=lms(y,N,muu,delay)
%
%	y			- Data sequence
%	N			- Dimension of the parameter vector
%	muu			- Step size
%   delay       - Delay of y, used as reference signal in ALE
%	thetahat		- Matrix with estimates of theta. 
%				  Row n corresponds to the estimate thetahat(n)'
%	xhat			- Estimate of x
%
%
%
%  lms: The Least-Mean Square Algorithm
%
% 	Estimator: yhat(n)=Y^{T}(n)thetahat(n-1)
%              xhat = y - yhat
%
%	thetahat is estimated using LMS. 
%
%     
%     Author: Ziyue Yang
%     Date: 2024.02.15

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [thetahat,xhat,yhat] = lms(y,N,muu,delay)

    % Initialize xhat and thetahat
    M = length(y);
    Y = zeros(M, N);
    xhat = zeros(M, 1);
    thetahat = zeros(M+1, N);
    y = [y; mean(y)];

    % Loop
    for n = 1:M

	    % Store the delayed samples of y in Y
        if n > delay
            Y(n+1,:) = circshift(Y(n,:), -1);
            Y(n+1, end) = y(n-delay); 
        end
        

	    % Estimate of noise
        yhat(n) = thetahat(n, :) * Y(n,:)';
    
	    % Update the n+1 row in the matrix thetahat which in the notation in the Lecture Notes
	    % corresponds to thetahat(n)
	    thetahat(n+1,:) = thetahat(n, :) + muu * Y(n,:) * (y(n+1)-yhat(n));

        % substract the estimation of noise to acquire speech x
        xhat(n) = y(n+1) - yhat(n);

    end
    
    % Shift thetahat one step so that row n corresponds to time n
    thetahat=thetahat(2:M+1,:);

end