function plotWeightProgress(weightLMS, weightNLMS, weightRLS)
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

