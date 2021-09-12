function [caCodesTable] = makeCATable(samplesPerCode,fs,codeFreqBasis)
%MAKECATABLE Summary of this function goes here
%   Detailed explanation goes here
caCodesTable = zeros(32, samplesPerCode);

%--- Find time constants --------------------------------------------------
ts = 1/fs;   % Sampling period in sec
tc = 1/codeFreqBasis;  % C/A chip period in sec

%=== For all satellite PRN-s ...
for PRN = 1:32
    %--- Generate CA code for given PRN -----------------------------------
    caCode = generateCACode(PRN);
    
    %=== Digitizing =======================================================
    
    %--- Make index array to read C/A code values -------------------------
    % The length of the index array depends on the sampling frequency -
    % number of samples per millisecond (because one C/A code period is one
    % millisecond).
    codeValueIndex = ceil((ts * (1:samplesPerCode)) / tc);
    
    %--- Correct the last index (due to number rounding issues) -----------
    codeValueIndex(end) = 1023;
    
    %--- Make the digitized version of the C/A code -----------------------
    % The "upsampled" code is made by selecting values form the CA code
    % chip array (caCode) for the time instances of each sample.
    caCodesTable(PRN, :) = caCode(codeValueIndex);
    
end % for PRN = 1:32
end