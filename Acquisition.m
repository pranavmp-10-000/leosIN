classdef Acquisition
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        pfa = 0.01;
        doppler_max = 10000;
        doppler_step = 250;
        threshold = 0;
    end
    
    methods
        function obj = Acquisition(pfa,doppler_max,doppler_step)
            obj.pfa = pfa;
            obj.doppler_max = doppler_max;
            obj.doppler_step = doppler_step;
        end
        function [threshold,effective_fft_size] = calculateThreshold(doppler_max,doppler_step,samplesPerCode,pfa)
            %CALCULATETHRESHOLD Summary of this function goes here
            %   Detailed explanation goes here
            d_num_doppler_bins = (doppler_max-(-doppler_max))/doppler_step;
            effective_fft_size = samplesPerCode;
            obj.num_doppler_bins = d_num_doppler_bins;
            obj.num_bins = (effective_fft_size * num_doppler_bins);
            obj.threshold = 2*gammaincinv((1-pfa)^(1/(num_bins)),2);
        end
        
        function [power] = calcInputPower(signal,effective_fft_size)
            %CALCINPUTPOWER Summary of this function goes here
            %   Detailed explanation goes here
            s_in = signal(1:effective_fft_size);
            power = sum(np.power(np.abs(s_in),2));
            K = length(s_in);
            power = power/K;
        end
        
        function [peakMetric, carrFreq,codePhases] = maxPower2InpPower()
            for i=1:acqSateliteList
                for j=1:obj.num_doppler_bins
                end
            end
        end
    end
end

