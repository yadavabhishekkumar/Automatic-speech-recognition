
function [newsig1,newsig2]=soln1(xn,Fs)
%break the sample into frames and removing noise
%input:(xn,Fs)  signal and sampling frequency of the input signal
%output: [newsig1,newsig2]  1 indiates signal signal ctting all noise   2
%indicates signal reducing noise to zero


frame_dur=0.01;             % I changed frame dur to increase the effciency because 0.1 was not sufficient for  a 4 second duration sound 
frame_len=Fs*frame_dur;
N=length(xn);

newsig2=xn;
nframe=floor(N/frame_len);
count=1;


for k = 1 : nframe
    
    
    framepart=xn((k-1)*frame_len+1 : k*frame_len);
   maxval= max(framepart);
   
   if(maxval>0.06)
       newsig1((count-1)*frame_len+1 : count*frame_len )=framepart;
       count=count+1;
   end
   
       
   if(maxval<0.06)
       newsig2((k-1)*frame_len+1 : k*frame_len )=zeros(frame_len,1);
       
   end
       
   
   
                                                                   
    
    
    
    
    
    
end