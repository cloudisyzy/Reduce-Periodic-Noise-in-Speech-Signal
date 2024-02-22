% [thetahat,xhat,yhat]=signAlgorithms(y,N,muu,delay)
%
%	y			- Data sequence
%	N			- Dimension of the parameter vector
%	muu			- Step size
%   delay       - Delay of y, used as reference signal in ALE, if delay=0,
%                 this becomes one step ahead prediction
%   Option      - =1 Sign Error; =2 Sign Regressorl; =3 Sign Sign
%	thetahat		- Matrix with estimates of theta. 
%				  Row n corresponds to the estimate thetahat(n)'
%	xhat			- Estimate of x
%
%
%
%  Sign Error / Sign Regressor / Sign Sign
%
% 	Estimator: yhat(n)=Y^{T}(n)thetahat(n-1)
%              xhat = y - yhat
%
%	thetahat is estimated using LMS. 
%
%     
%     Author: Ziyue Yang
%     Date: 2024.02.21

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [thetahat,xhat,yhat] = lmsSign(y,N,muu,delay,Option)

    % Initialization
    M = length(y);
    Y = zeros(N, M);
    xhat = zeros(M, 1);
    yhat = zeros(M, 1);
    thetahat = zeros(N, M+1);

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
    
	    % Update the n+1 row in the matrix thetahat which in the notation in the Lecture Notes
	    % corresponds to thetahat(n)
        if Option == 1
	        thetahat(:, n+1) = thetahat(:, n) + muu * Y(:, n) * sign(xhat(n));
        elseif Option == 2
            thetahat(:, n+1) = thetahat(:, n) + muu * sign(Y(:, n)) * xhat(n);
        elseif Option == 3
            thetahat(:, n+1) = thetahat(:, n) + muu * sign(Y(:, n)) * sign(xhat(n));
        end

%         lms([1:10]', 5, 0.01, 0);
%         n
%         Y(:, n)'
%         y(n)
%         yhat(n)

    end
    
    % Shift thetahat one step so that row n corresponds to time n
    thetahat=thetahat(:, 2:M+1);

end