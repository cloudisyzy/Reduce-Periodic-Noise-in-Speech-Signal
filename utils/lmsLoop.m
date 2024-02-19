function xhat = lmsLoop(y,N,muu_list,delay,num_iteration)
    
    i = 1;
    [~,xhat,~] = lms(y, N, muu_list(i), delay);

    for i = 2:num_iteration
        [~,xhat,~] = lms(xhat, N, muu_list(i), delay);
    end

end

