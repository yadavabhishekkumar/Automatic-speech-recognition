

function [pxx,f2,nframes]=sampleandpyulear(newsig1,Fs)
%input:newsig1(signal trunctaed containing the main information),Fs(sampling frequency)  output:[pxx,f2]
frameduration=0.025;          %it was 0.025
seglength = Fs*frameduration; % Length of frames
overlap = seglength/2; % # of samples to overlap
stepsize = seglength - overlap; % Frame step size
nframes = floor(length(newsig1)/stepsize-1);
samp1 = 1; samp2 = seglength;%Initialize frame start and end
 
w=hamming(400);  %  size of hamming window is 400
for i = 1:(nframes)
% Get current frame for analysis
frame(i,1:400) = newsig1(samp1:samp2);    %storing samples in matrix   of order   nframes*400
frame(i,1:end)=frame(i,1:end).*w';
% Step up to next frame of speech
samp1 = samp1 + stepsize;
samp2 = samp2 + stepsize;
order = 12;
nfft = 512;

[pxx(i,1:257),f2]=pyulear(frame(i,1:400),order,nfft,Fs);


end
