function plotWeightProgress(weightLMS, weightNLMS, weightRLS)
%   Randomly select 5 indexes out of filter taps, plot the progresses of
%   the corresponding weights
%   Author: Ziyue Yang
%   Date: 2024.02.21

    idxList = sort(randperm(size(weightLMS,1), 5));

    figure;
    sgtitle('The progress of 5 weights from random indexes', 'FontSize', 14);

    subplot(3,1,1)
    for i = idxList
        plot(1:size(weightLMS,2), weightLMS(i, :))
        hold on
    end
    title('LMS')
    xlim([1 size(weightLMS,2)])

    subplot(3,1,2)
    for i = idxList
        plot(1:size(weightNLMS,2), weightNLMS(i, :))
        hold on
    end
    title('NLMS')
    xlim([1 size(weightNLMS,2)])

    subplot(3,1,3)
    for i = idxList
        plot(1:size(weightRLS,2), weightRLS(i, :))
        hold on
    end
    title('RLS')
    xlim([1 size(weightRLS,2)])

end

% function plotWeightProgress(weightLMS, weightNLMS, weightRLS)
%     idxList = sort(randperm(size(weightLMS,1), 5));
%     numSteps = size(weightLMS, 2); % Assuming all weight matrices have the same number of columns
% 
%     figure;
%     sgtitle('The progress of 5 weights from random indexes - Dynamic', 'FontSize', 14);
% 
%     for step = 1:500:numSteps
%         clf; % Clear current figure content
% 
%         % LMS
%         subplot(3,1,1);
%         for i = idxList
%             plot(1:step, weightLMS(i, 1:step));
%             hold on;
%         end
%         title('LMS');
%         xlim([1 numSteps]);
%         xlabel('Time Step');
%         ylabel('Weight');
%         legend(arrayfun(@(x) sprintf('Index %d', x), idxList, 'UniformOutput', false), 'Location', 'best');
% 
%         % NLMS
%         subplot(3,1,2);
%         for i = idxList
%             plot(1:step, weightNLMS(i, 1:step));
%             hold on;
%         end
%         title('NLMS');
%         xlim([1 numSteps]);
%         xlabel('Time Step');
%         ylabel('Weight');
%         legend(arrayfun(@(x) sprintf('Index %d', x), idxList, 'UniformOutput', false), 'Location', 'best');
% 
%         % RLS
%         subplot(3,1,3);
%         for i = idxList
%             plot(1:step, weightRLS(i, 1:step));
%             hold on;
%         end
%         title('RLS');
%         xlim([1 numSteps]);
%         xlabel('Time Step');
%         ylabel('Weight');
%         legend(arrayfun(@(x) sprintf('Index %d', x), idxList, 'UniformOutput', false), 'Location', 'best');
% 
%         drawnow; % Update figure window
%         pause(0.001); % Pause to allow visualization of the update
%     end
% end



