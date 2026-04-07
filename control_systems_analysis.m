% control_systems_analysis.m
% This file contains functions for control systems analysis in MATLAB.

function sys = create_transfer_function(num, den)
    % Create a transfer function from numerator and denominator coefficients
    sys = tf(num, den);
end

function step_response(sys)
    % Analyze the step response of the system
    figure;
    step(sys);
    title('Step Response');
end

function bode_plot(sys)
    % Generate Bode plot for the system
    figure;
    bode(sys);
    title('Bode Plot');
end

function pole_zero_analysis(sys)
    % Perform pole-zero analysis
    [zeros, poles, gain] = zpkdata(sys);
    fprintf('Zeros: %s\n', mat2str(zeros));
    fprintf('Poles: %s\n', mat2str(poles));
    fprintf('Gain: %.2f\n', gain);
end

% Example Usage:
% sys = create_transfer_function([1], [1, 2, 1]);
% step_response(sys);
% bode_plot(sys);
% pole_zero_analysis(sys);
