clear;clc;
close all;

path = 'C:\Users\OneDrive\USRP\e-data\IQ\SRP221-0.85g-715\IQ1_Data.mat';


load(path);


sample_rate = 2^21;
T = length(IQ1)/sample_rate;
N = sample_rate*(2^0);


IQ1_D = IQ1;
IQ1_m = reshape(abs(IQ1_D),sample_rate,T)';
IQ1_m(IQ1_m==0) = NaN;
% RSSI_IQ1 = 10*log10(IQ1_m);
IQ1_F = reshape(IQ1_D,sample_rate,T)';
iq1_fft = abs(fft(IQ1_F,N,2));



th = round(1*sample_rate*1);
sh = round(0.01*sample_rate*1);



x = 168076;
s = 168676;
ymax = 900;

jx = 70;
x = sh+x -jx;
s = sh+s -jx;

t_test = 0.05;

for i =1:T-1
    [R1,P1] = corrcoef(iq1_fft(1,x:s),iq1_fft(i+1,x:s));
    r1(i) = R1(1,2);
    p1(i) = P1(1,2);
end
[pks1,loc1] = findpeaks(r1);


for i =1:T-1
    [R2,P2] = corrcoef(iq1_fft(2,x:s),iq1_fft(i+1,x:s));
    r2(i) = R2(1,2);
    p2(i) = P2(1,2);
end
[pks2,loc2] = findpeaks(r2);




for i =1:T-1
    [R3,P3] = corrcoef(iq1_fft(3,x:s),iq1_fft(i+1,x:s));
    r3(i) = R3(1,2);
    p3(i) = P3(1,2);
end
[pks3,loc3] = findpeaks(r3);



for i =1:T-1
    [R4,P4] = corrcoef(iq1_fft(4,x:s),iq1_fft(i+1,x:s));
    r4(i) = R4(1,2);
    p4(i) = P4(1,2);
end
[pks4,loc4] = findpeaks(r4);


for i =1:T-1
    [R5,P5] = corrcoef(iq1_fft(T-1-3,x:s),iq1_fft(i+1,x:s));
    r5(i) = R5(1,2);
    p5(i) = P5(1,2);
end
[pks5,loc5] = findpeaks(r5);


for i =1:T-1
    [R6,P6] = corrcoef(iq1_fft(T-1-2,x:s),iq1_fft(i+1,x:s));
    r6(i) = R6(1,2);
    p6(i) = P6(1,2);
end
[pks6,loc6] = findpeaks(r6);




for i =1:T-1
    [R7,P7] = corrcoef(iq1_fft(T-1-1,x:s),iq1_fft(i+1,x:s));
    r7(i) = R7(1,2);
    p7(i) = P7(1,2);
end
[pks7,loc7] = findpeaks(r7);



for i =1:T-1
    [R8,P8] = corrcoef(iq1_fft(T-1,x:s),iq1_fft(i+1,x:s));
    r8(i) = R8(1,2);
    p8(i) = P8(1,2);
end
[pks8,loc8] = findpeaks(r8);


figure;
y_m = 2000
subplot(2,4,1)
plot(iq1_fft(1,x:s))
ylim([0,y_m]);
subplot(2,4,2)
plot(iq1_fft(2,x:s))
ylim([0,y_m]);
subplot(2,4,3)
plot(iq1_fft(3,x:s))
ylim([0,y_m]);
subplot(2,4,4)
plot(iq1_fft(4,x:s))
ylim([0,y_m]);
subplot(2,4,5)
plot(iq1_fft(5,x:s))
ylim([0,y_m]);
subplot(2,4,6)
plot(iq1_fft(6,x:s))
ylim([0,y_m]);
subplot(2,4,7)
plot(iq1_fft(7,x:s))
ylim([0,y_m]);
subplot(2,4,8)
plot(iq1_fft(8,x:s))
ylim([0,y_m]);

figure;
subplot(2,4,1)

plot(r1)
% plot(p1);
hold on;
bar(loc1,pks1,0.14,'r');
title('Peak 1 on spy camera 1','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('Coefficient','fontsize',24)
ylim([0,1]);
% legend('p-value','t-test','fontsize',21)

subplot(2,4,2)
plot(r2);
hold on;
bar(loc2,pks2,0.14,'r');
title('Peak 2 on spy camera 1','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('Coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)
ylim([0,1]);


% figure;
subplot(2,4,3)
plot(r3);
hold on;
bar(loc3,pks3,0.14,'r');
title('Peak 1 on spy camera 2','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('Coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)
ylim([0,1]);

subplot(2,4,4)
plot(r4)
hold on;
bar(loc4,pks4,0.14,'r');
title('Peak 2 on spy camera 2','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('Coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)
ylim([0,1]);

subplot(2,4,5)
plot(r5)
hold on;
bar(loc5,pks5,0.14,'r');
title('Peak 1 on spy camera 1','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('Coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)
ylim([0,1]);


subplot(2,4,6)
plot(r6);
hold on;
bar(loc6,pks6,0.14,'r');
title('Peak 2 on spy camera 1','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('Coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)
ylim([0,1]);


% figure;
subplot(2,4,7)
plot(r7);
hold on;
bar(loc7,pks7,0.14,'r');
title('Peak 1 on spy camera 2','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('Coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)
ylim([0,1]);


subplot(2,4,8)
plot(r8)
hold on;
bar(loc8,pks8,0.14,'r');
title('Peak 2 on spy camera 2','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('Coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)
ylim([0,1]);



