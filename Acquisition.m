classdef Acquisition
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        pfa = 0.01;
        doppler_max = 10000;
        doppler_step = 250;
        threshold = 0;
        samplesPerCode = 0;
        effective_fft_size=0;
        d_num_doppler_bins=0;
    end
    
    methods
        function obj = Acquisition(pfa,doppler_max,doppler_step,samplesPerCode)
            obj.pfa = pfa;
            obj.doppler_max = doppler_max;
            obj.doppler_step = doppler_step;
            obj.samplesPerCode = samplesPerCode;
        end
        function [obj] = calcThreshold(obj)
            %CALCULATETHRESHOLD Summary of this function goes here
            %   Detailed explanation goes here
            obj.d_num_doppler_bins = (obj.doppler_max-(-obj.doppler_max))/obj.doppler_step;
            obj.effective_fft_size = obj.samplesPerCode;
            num_bins = (obj.effective_fft_size * obj.d_num_doppler_bins);
            obj.threshold = 2*gammaincinv((1-obj.pfa)^(1/(num_bins)),2);
        end
        
        function [power] = calcInputPower(obj,signal)
            %CALCINPUTPOWER Summary of this function goes here
            %   Detailed explanation goes here
            s_in = signal(1:obj.effective_fft_size);
            power = sum(np.power(np.abs(s_in),2));
            K = length(s_in);
            power = power/K;
        end
        
        function magGrid = dopplerUpdate(signal,num_doppler_bins)
            magnitudeGrid = zeros(num_doppler_bins,obj.samplesPerCode);
            for i=1:num_doppler_bins
                fd = IF - obj.doppler_max + obj.doppler_step * i;%doppler wipeoff
                signalCarr = exp(1i*(fd*phasePoints));
                % "Remove carrier" from the signal -----------------------------
                x_k = signal.*signalCarr;%
                x_K = fft(x_k,obj.effective_fft_size);
                Y_k = x_K.*caCodeFreqDom;
                Y_K = ifft(Y_k,obj.effective_fft_size);
                magnitudeGrid(i,:) = (1/(obj.effective_fft_size))*Y_K;
            end
            magGrid = abs(magnitudeGrid).^2;
        end
        
        function [peakMetric, carrFreq,codePhases] = maxPower2InpPower(signal)
            carrFreq = zeros(1,length(acqSatelliteList));
            codePhaseRes =zeros(1,length(acqSatelliteList));
            peakMetric = zeros(1,length(acqSatelliteList));
            magGrid = zeros(obj.num_doppler_bins,obj.samplesPerCode);
            caCodesTable = makeCATable(obj.samplesPerCode,fs,codeFreqBasis);
            for i=1:acqSateliteList
                caCodesT = caCodesTable(i);
                caCodeFreqDom = conj(fft(caCodesT,obj.effective_fft_size));
                magGrid = dopplerUpdate(signal,num_dopper_bins);
            end
        end
    end
end

