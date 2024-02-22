function stepUpperBound = judgeStabilityLMS(y, N, muu, gamma)
%   Used to detect instability in LMS algorithm
%   y       -   y(n), observations, to compute SigmaYY
%   N       -   Filter length, or the length(1 out of 2 dimens) of SigmaYY
%   muu     -   step size of LMS
%   lambda  -   leakage factor for LeakyLMS, for standard LMS, lambda = 0
%   Author: Ziyue Yang
%   Date: 2024.02.21
    
    SigmaYY = covhat(y ,N);
    lambda_max = max(eig(SigmaYY));
    stepUpperBound = 2 / (lambda_max+gamma);
    
    if muu >= stepUpperBound
        warning('LMS unstable, use step size no greater than %.3f',stepUpperBound)
    else
        disp('LMS is stable')
    end
    
end

