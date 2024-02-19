function xhat = nlmsLoop(y,N,muu_list,c,delay,num_iteration)
    
    i = 1;
    [~,xhat,~] = nlms(y, N, muu_list(i), c, delay);

    for i = 2:num_iteration
        [~,xhat,~] = nlms(xhat, N, muu_list(i), c, delay);
    end

end

