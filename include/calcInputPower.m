function [power] = calcInputPower(signal,effective_fft_size)
%CALCINPUTPOWER Summary of this function goes here
%   Detailed explanation goes here
s_in = signal(1:effective_fft_size);
power = sum(np.power(np.abs(s_in),2));
K = length(s_in);
power = power/K;
end

