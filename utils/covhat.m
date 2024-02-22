% SigmaYYhat = covhat(y,N)
%
%	y			- Data sequence
%	N			- Size of covariance matrix
%
%  covhat: Estimates SigmaYY=E[Y(n)Y^{T}(n)]
%
%		where 
%
%	   	Y(n)=[y(n) y(n-1) ... y(n-N+1)]^{T}
%
%     
%     Author: Ziyue Yang
%     Date: 2024.01.24

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function SigmaYYhat = covhat(y, N)
    
%     y is colomn vector
    r_yy = zeros(N, 1);
    M = length(y);
%     By defination
    for k = 1:N
        r_yy(k) = y(1:M-k+1)' * y(k:end) / M;
    end
    
%     expand r_yy to SigmaYY
    SigmaYYhat = toeplitz(r_yy);

end