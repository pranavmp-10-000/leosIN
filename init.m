filename = 'data/2013_04_04_GNSS_SIGNAL_at_CTTC_SPAIN.dat';

%Sat frequency 
acq_fs = getSatFreq('L1CA');
% Raw signal Parameters
IF = 0;
fs = 4e6;
codeFreqBasis = 1.023e6;
codeLength = 1023;
samplesPerCode = round(fs/(codeFreqBasis/codeLength));

% Acquisition Settings
skipAcquisition = 0;
acqSatelliteList = 1:32;
acqSearchBand = 14;
acqThreshold = 2.5;
acquisitionCohCodePeriods=2;
acquisitionNonCodePeriods=2;
pfa = 0.01;
doppler_max = 10000;
doppler_step = 250;

%Filter settings
downSample = 1;
downSample_fs = 2e6;
downSample_step = (fs/downSample_fs); %Skip every 1 sample

fileType=2;
dataOffset=80;


