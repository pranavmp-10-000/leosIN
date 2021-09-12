function [Freq] = getSatFreq(satName)
%GETSATFREQ Summary of this function goes here
%   Detailed explanation goes here
if strcmp(satName,'L1CA')
    Freq = 1.57542e9;  % L1_CA
    
elseif strcmp(satName,'L2')
    Freq = 1.22760e9;       %  L2     frequency (Hz)
    
elseif strcmp(satName,'L5')
    Freq = 1.17645e9 ;      %  L5/E5a frequency (Hz)
    
elseif strcmp(satName,'E6')
    Freq = 1.27875e9 ;      %  E6/LEX frequency (Hz)
    
elseif strcmp(satName,'E5b')
    Freq = 1.20714e9;       %  E5b    frequency (Hz)

elseif strcmp(satName, 'E5a+b')
    Freq = 1.191795e9 ;     %  E5a+b  frequency (Hz)

elseif strcmp(satName,'S')
    Freq = 2.492028e9;      %  S      frequency (Hz)
end
% FREQ1_GLO = 1.60200e9   %  GLONASS G1 base frequency (Hz)
% DFRQ1_GLO = 0.56250e6   %  GLONASS G1 bias frequency (Hz/n)
% FREQ2_GLO = 1.24600e9   %  GLONASS G2 base frequency (Hz)
% DFRQ2_GLO = 0.43750e6   %  GLONASS G2 bias frequency (Hz/n)
% FREQ3_GLO = 1.202025e9  %  GLONASS G3 frequency (Hz)
% FREQ1_BDS = 1.561098e9  %  BeiDou B1 frequency (Hz)
% FREQ2_BDS = 1.20714e9   %  BeiDou B2 frequency (Hz)
% FREQ3_BDS = 1.26852e9   %  BeiDou B3 frequency (Hz)
end

