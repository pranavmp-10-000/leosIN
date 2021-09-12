function [data,samplesRecorded] = readData(fileName,fileType,origin,offset,count)
%READDATA Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(fileName);
status = fseek(fid,offset,origin);
if status==0
    [data, samplesRecorded] = fread(fid,[1,count],fileType);
end
fclose(fid);

end

