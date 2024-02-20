function dynamicWeightResponsePlot(weightLMS, weightNLMS, weightRLS, idxRange)
%   Plot the evolution of weights for LMS, NLMS, and RLS in time and frequency domain
%   for the specified index range, focusing on normalized frequency 0 to 0.5 with a sampling rate of 8000 Hz.
%   Author: Ziyue Yang
%   Date: 2024.02.20

    figure;
    for i = idxRange
        clf;

        % Time domain plot
        subplot(2,1,1);
        stem(weightLMS(:, i), 'b', '-*'); 
        hold on; 
        stem(weightNLMS(:, i), 'r');
        stem(weightRLS(:, i), '-x', 'Color', '#77AC30'); 
        title(sprintf('Filter Weights at Index %d - Time Domain', i));
        xlabel('Index');
        ylabel('Weight');
        legend('LMS', 'NLMS', 'RLS');
        ylim([-0.2, 0.2]);
        hold off;

        % Frequency domain plot
        subplot(2,1,2);  
        [~,~] = spectraEstimationSmall(weightLMS(:, i),'half',1);
        hold on;
        [~,~] = spectraEstimationSmall(weightNLMS(:, i),'half',1);
        [~,~] = spectraEstimationSmall(weightRLS(:, i),'half',1);
        ylim([-90 -10])
        title(sprintf('Frequency Domain Response at Index %d', i));
        xlabel('Normalized Frequency');
        ylabel('Magnitude');
        legend('LMS', 'NLMS', 'RLS');
        xlim([0, 0.5]);
        hold off;

        drawnow; 
        pause(0.0001);
    end
end
