function [threshold,effective_fft_size] = calculateThreshold(doppler_max,doppler_step,samplesPerCode,pfa)
%CALCULATETHRESHOLD Summary of this function goes here
%   Detailed explanation goes here
d_num_doppler_bins = (doppler_max-(-doppler_max))/doppler_step;
effective_fft_size = samplesPerCode;
num_doppler_bins = d_num_doppler_bins;
num_bins = (effective_fft_size * num_doppler_bins);
threshold = 2*gammaincinv((1-pfa)^(1/(num_bins)),2);
end

