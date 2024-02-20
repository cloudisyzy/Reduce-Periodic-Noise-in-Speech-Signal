function plotComp(y, xhatlms, xhatnlms, xhatrls, yhatlms, yhatnlms, yhatrls)

    figure;
    sgtitle('Noisy Speech', 'FontSize', 14);
    subplot(1,2,1)
    plot(1:length(y), y)
    ylim([-1 1])
    xlim([1 32001])
    title('Time Domain')
    xlabel('Time')
    ylabel('Magnitude')
    subplot(1,2,2)
    [~,~] = spectraEstimation(y,'half',1);
    title('Spectrum')
    xlabel('Normalized Frequency \nu')
    ylabel('Magnitude')

    figure;
    sgtitle('Estimated Denoised Speech', 'FontSize', 14);
    subplot(3,2,1)
    plot(1:length(y), xhatlms)
    ylim([-1 1])     
    xlim([1 32001])
    title('LMS Time Domain')
    xlabel('Time')
    ylabel('Magnitude')
    subplot(3,2,2)
    [~,~] = spectraEstimation(xhatlms,'half',1);
    title('LMS Spectrum')
    xlabel('Normalized Frequency \nu')
    ylabel('Magnitude')
    subplot(3,2,3)
    plot(1:length(y), xhatnlms)
    ylim([-1 1])     
    xlim([1 32001])
    title('NLMS Time Domain')
    xlabel('Time')
    ylabel('Magnitude')
    subplot(3,2,4)
    [~,~] = spectraEstimation(xhatnlms,'half',1);
    title('NLMS Spectrum')
    xlabel('Normalized Frequency \nu')
    ylabel('Magnitude')
    subplot(3,2,5)
    plot(1:length(y), xhatrls)
    ylim([-1 1])     
    xlim([1 32001])
    title('RLS Time Domain')
    xlabel('Time')
    ylabel('Magnitude')
    subplot(3,2,6)
    [~,~] = spectraEstimation(xhatrls,'half',1);
    title('RLS Spectrum')
    xlabel('Normalized Frequency \nu')
    ylabel('Magnitude')

    figure;
    sgtitle('Estimated Sinusoidal Noise', 'FontSize', 14);
    subplot(3,2,1)
    plot(1:length(y), yhatlms)
    ylim([-1 1])     
    xlim([1 32001])
    title('LMS Time Domain')
    xlabel('Time')
    ylabel('Magnitude')
    subplot(3,2,2)
    [~,~] = spectraEstimation(yhatlms,'half',1);
    title('LMS Spectrum')
    xlabel('Normalized Frequency \nu')
    ylabel('Magnitude')
    subplot(3,2,3)
    plot(1:length(y), yhatnlms)
    ylim([-1 1])     
    xlim([1 32001])
    title('NLMS Time Domain')
    xlabel('Time')
    ylabel('Magnitude')
    subplot(3,2,4)
    [~,~] = spectraEstimation(yhatnlms,'half',1);
    title('NLMS Spectrum')
    xlabel('Normalized Frequency \nu')
    ylabel('Magnitude')
    subplot(3,2,5)
    plot(1:length(y), yhatrls)
    ylim([-1 1])     
    xlim([1 32001])
    title('RLS Time Domain')
    xlabel('Time')
    ylabel('Magnitude')
    subplot(3,2,6)
    [~,~] = spectraEstimation(yhatrls,'half',1);
    title('RLS Spectrum')
    xlabel('Normalized Frequency \nu')
    ylabel('Magnitude')

end

