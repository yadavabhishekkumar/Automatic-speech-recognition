function [H,H1]=melfilterbank()
f_low=300;
f_high=8000;
filt_num=26;
fs=16000;
nfft=512;
%% computing band in mel-scale
mel_low=2595*log10(1+(f_low/100));
mel_high=2595*log10(1+(f_high/100));
%% creating the mel-scaled vector
Mel = linspace(mel_low,mel_high,filt_num);
%% computing frequencies of the Mel vector
Freq=100*((10.^(Mel/2595))-1);
%Freq=mel2hz(Mel);
t=1;
%% convert frequencies to nearest bins
for i=1:filt_num
f(i) = floor((nfft+1)*Freq(i)/fs);
end 
    for m =2:length(Mel)-1                            % be careful with the indices   as changing it would cause error
        for k=1:nfft+1
            if (k<f(m-t));H(m,k)=0;
            elseif (k>=f(m-t) && k<=(f(m)));H(m,k)=(k-f(m-t))/(f(m)-f(m-t));
            elseif (k>=f(m) && k<=f(m+t));H(m,k)=(f(m+t)-k)/(f(m+t)-f(m));
            elseif (k>f(m+t));H(m,k)=0;
            end
        end
    end
    
    H1=H;
    for i=1:filt_num
f1(i) = Freq(i);
end 
    for m =2:length(Mel)-1                            % be careful with the indices   as changing it would cause error
        for k=1:f_high
            if (k<f1(m-t));H1(m,k)=0;
            elseif (k>=f1(m-t) && k<=(f1(m)));H1(m,k)=(k-f1(m-t))/(f1(m)-f1(m-t));
            elseif (k>=f1(m) && k<=f1(m+t));H1(m,k)=(f1(m+t)-k)/(f1(m+t)-f1(m));
            elseif (k>f1(m+t));H1(m,k)=0;
            end
        end
    end
end