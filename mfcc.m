function [MF1,xy]=mfcc(H3,pxx,nframes)
%calculating the product of filter and powerspectrum
%enter two parameters  1>H3 filterbank matrix 2> pxx power spectrum matrix of
%output: [MF1,xy]  where  MF1  is the mfcc matrix(first twelve coeff for each frame) and xy is the array of sum of all
%the coeefients of a particular frame
nfft=512;filt_num=25;

  for i=1:nframes
    for j=2:filt_num
          for k=1:nfft
            L=H3(j,1:end).*pxx(i,1:end);
           end
        xy(i)=sum(L);
        MF(i,j)=log(sum(L));
      end
    MF(i,1:end)=real(ifft(MF(i,1:end)));
    MF1(i,1:12)=MF(i,1:12);
  end



            




