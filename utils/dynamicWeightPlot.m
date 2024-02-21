function dynamicWeightPlot(weightLMS, weightNLMS, weightRLS, idxRange)
%   Plot the evolution of weights for lms, nlms and rls for the given index
%   range
%   Author: Ziyue Yang
%   Date: 2024.02.20

    numColumns = size(weightLMS, 2);
%     numColumns = min(600, numColumns);
    
    figure;
    hold on;
    for i = idxRange
        clf;
        stem(weightLMS(:, i), 'b', '-*'); 
        hold on; 
        stem(weightNLMS(:, i), 'r');
        stem(weightRLS(:, i), '-x', Color='#77AC30'); 
        title(sprintf('Filter Weights at Index %d', i));
        xlabel('Index');
        ylabel('Weight');
        legend('LMS', 'NLMS', 'RLS');
        ylim([-0.2 0.2])

        drawnow; 
        pause(0.0001);
    end
    hold off;

end
