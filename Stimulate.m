clear;clc;close all;

load("C:\Users\OneDrive\USRP\e-data\IQ\SRP221-1.6g-107\IQ1_Data.mat")

boost = 1;
sample_rate = 2^19/boost;
T = length(IQ1)/sample_rate;

IQ1_D = IQ1;
IQ1_m = reshape(abs(IQ1_D),sample_rate,T)';
IQ1_m(IQ1_m==0) = NaN;
RSSI_IQ1 = 10*log10(IQ1_m);
IQ1_F = reshape(IQ1_D,sample_rate,T)';
N = sample_rate*(2^0);
iq1_fft = abs(fft(IQ1_F,N,2));
% iq1_fft_n = normalize(iq1_fft,2,'range');



figure;
subplot(2,1,1)
plot(abs(iq1_fft(9,:)))
% xlim([x,s]);
ylim([0,2000]);
subplot(2,1,2)
plot(abs(iq1_fft(10,:)))
% xlim([x,s]);
ylim([0,2000]);


x = floor(265548/boost);
s = floor(265748/boost);



% 
for i =1:T-1
    [h_data1(i,1),p_data1(i,1),ci,stats] = ttest2(iq1_fft(i,x:s),iq1_fft(i+1,x:s));
end







figure;
plot(p_data1);
hold on;
bar(h_data1,0.3,'r');
title('Peak 1 on spy camera 1','fontsize',21);
xlabel('time(s)','fontsize',24);
ylabel('p-value and t-test','fontsize',24)
legend('p-value','t-test','fontsize',21)




