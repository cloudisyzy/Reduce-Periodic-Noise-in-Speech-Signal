% [thetahat,xhat,yhat]=lmsVolterra(y,N,muu,delay)
%
%	y			- Data sequence
%	N			- Dimension of the parameter vector
%	muu			- Step size
%   delay       - Delay of y, used as reference signal in ALE, if delay=0,
%                 this becomes one step ahead prediction
%	thetahat		- Matrix with estimates of theta. 
%				  Row n corresponds to the estimate thetahat(n)'
%	xhat			- Estimate of x
%
%
%
%  lmsVolterra: The Least-Mean Square Volterra Algorithm
%
% 	Estimator: yhat(n)=Y^{T}(n)thetahat(n-1)
%              xhat = y - yhat
%
%	thetahat is estimated using LMS Volterra. 
%
%     
%     Author: Ziyue Yang
%     Date: 2024.02.22

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [thetahat,xhat,yhat] = lmsVolterra(y,N,muu,delay)

    % Initialization
    M = length(y);
    Y = zeros(N, M);
    xhat = zeros(M, 1);
    yhat = zeros(M, 1);
    L = N + N*(N+1)/2;
    thetahat = zeros(L, M+1);

    % Loop
    for n = 1:M

	    % Store the delayed samples of y in Y
        if n > delay
            Y(:, n+1) = circshift(Y(:, n), -1);
            Y(end, n+1) = y(n-delay); 
        end

        Phi = generatePsiN(Y(:, n));
        
	    % Estimate of noise
        yhat(n) = Phi' * thetahat(:, n);

        % substract the estimation of noise to acquire speech x
        xhat(n) = y(n) - yhat(n);
    
	    % Update the n+1 row in the matrix thetahat which in the notation in the Lecture Notes
	    % corresponds to thetahat(n)
	    thetahat(:, n+1) = thetahat(:, n) + muu * Phi * xhat(n);

%         lms([1:10]', 5, 0.01, 0);
%         n
%         Y(:, n)'
%         y(n)
%         yhat(n)

    end
    
    % Shift thetahat one step so that row n corresponds to time n
    thetahat=thetahat(:, 2:M+1);

end



function psi_n = generatePsiN(Y)
    % Generates the psi(n) vector [u(n), u(n-1), ..., u(n-L+1), u(n)^2, u(n)u(n-1), ..., u(n-L+1)^2]
    % Y is the input vector [u(n), u(n-1), ..., u(n-L+1)]
    % The length of Y is L
    L = length(Y);
    % Length of psi
    psi_n_length = L + L*(L+1)/2;
    % Initialize psi vector
    psi_n = zeros(psi_n_length, 1);
    % Copy the elements of Y into the psi(n) vector
    psi_n(1:L) = Y;
    % Append all possible two-element products
    index = L + 1;
    for i = 1:L
        for j = i:L
            psi_n(index) = Y(i) * Y(j);
            index = index + 1;
        end
    end
end


