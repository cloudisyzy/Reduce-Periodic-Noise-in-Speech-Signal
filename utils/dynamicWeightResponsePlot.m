function dynamicWeightResponsePlot(weightLMS, weightNLMS, weightRLS, idxRange)
%   Plot the evolution of weights for LMS, NLMS, and RLS in time and frequency domain
%   for the specified index range, focusing on normalized frequency 0 to 0.5 with a sampling rate of 8000 Hz.
%   Author: Ziyue Yang
%   Date: 2024.02.20

    figure;
    sgtitle('Filter Progression', 'FontSize', 14);

    for i = idxRange
        clf;

        % Time domain plot
        subplot(2,1,1);
        stem(weightLMS(:, i), 'b', '-*'); 
        hold on; 
        stem(weightNLMS(:, i), 'r');
        stem(weightRLS(:, i), '-x', 'Color', '#77AC30'); 
        title(sprintf('Impulse Response at Index %d', i));
        xlabel('Time');
        ylabel('Weight');
        legend('LMS', 'NLMS', 'RLS');
        ylim([-0.2, 0.2]);
        hold off;

        % Frequency domain plot
        subplot(2,1,2);  
        H_lms = abs(fft(weightLMS(:, i), 1024));
        H_lms = H_lms(1:1024/2 +1);
        plot(linspace(0,0.5,length(H_lms)), 20*log10(H_lms), 'b')
        hold on
        H_nlms = abs(fft(weightNLMS(:, i), 1024));
        H_nlms = H_nlms(1:1024/2 +1);
        plot(linspace(0,0.5,length(H_nlms)), 20*log10(H_nlms), 'r')
        H_rls = abs(fft(weightRLS(:, i), 1024));
        H_rls = H_rls(1:1024/2 +1);
        plot(linspace(0,0.5,length(H_rls)), 20*log10(H_rls), 'Color', '#77AC30')
        ylim([-50 10])
        title(sprintf('Frequency Response at Index %d', i));
        xlabel('Normalized Frequency \nu');
        ylabel('Magnitude');
        legend('LMS', 'NLMS', 'RLS');
        xlim([0, 0.5]);
        hold off;
        
%         subplot(2,1,2);  
%         [~,~] = spectraEstimationSmall(weightLMS(:, i),'half',1);
%         hold on;
%         [~,~] = spectraEstimationSmall(weightNLMS(:, i),'half',1);
%         [~,~] = spectraEstimationSmall(weightRLS(:, i),'half',1);
%         ylim([-40 10])
%         title(sprintf('Frequency Domain Response at Index %d', i));
%         xlabel('Normalized Frequency');
%         ylabel('Magnitude');
%         legend('LMS', 'NLMS', 'RLS');
%         xlim([0, 0.5]);
%         hold off;

        drawnow; 
        pause(0.0001);
    end
end
