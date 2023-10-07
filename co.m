clear;clc;close all;

load("C:\Users\OneDrive\USRP\e-data\IQ\SRP221-1.6g-107\IQ1_Data.mat")
% % 
boost = 0;
sample_rate = 2^21*(2^boost);
T = length(IQ1)/sample_rate;

IQ1_D = IQ1;
IQ1_m = reshape(abs(IQ1_D),sample_rate,T)';
IQ1_m(IQ1_m==0) = NaN;
RSSI_IQ1 = 10*log10(IQ1_m);
IQ1_F = reshape(IQ1_D,sample_rate,T)';
N = sample_rate*(2^boost);
iq1_fft = abs(fft(IQ1_F,N,2));



subplot(2,1,1)
plot(abs(iq1_fft(9,:)))
% xlim([x,s]);
ylim([0,2000]);
subplot(2,1,2)
plot(abs(iq1_fft(10,:)))
% xlim([x,s]);
ylim([0,2000]);

it = 31250;

x = floor(296698*(2^boost));
s = floor(297098*(2^boost));

% 
for i =1:T-1
    [R1,P1] = corrcoef(iq1_fft(i,x:s),iq1_fft(i+1,x:s));
    r1(i) = R1(1,2);
    p1(i) = P1(1,2);
end


x = floor((x+it)*(2^boost));
s = floor((s+it)*(2^boost));

% x = floor(303139/boost);
% s = floor(303339/boost);
% 
for i =1:T-1
    [R2,P2] = corrcoef(iq1_fft(i,x:s),iq1_fft(i+1,x:s));
    r2(i) = R2(1,2);
    p2(i) = P2(1,2);
end




x = floor((x+2*it)*(2^boost));
s = floor((s+2*it)*(2^boost));

for i =1:T-1
    [R3,P3] = corrcoef(iq1_fft(i,x:s),iq1_fft(i+1,x:s));
    r3(i) = R3(1,2);
    p3(i) = P3(1,2);
end

x = floor((x+3*it)*(2^boost));
s = floor((s+3*it)*(2^boost));

for i =1:T-1
    [R4,P4] = corrcoef(iq1_fft(i,x:s),iq1_fft(i+1,x:s));
    r4(i) = R4(1,2);
    p4(i) = P4(1,2);
end

x = floor((x+4*it)*(2^boost));
s = floor((s+4*it)*(2^boost));

for i =1:T-1
    [R5,P5] = corrcoef(iq1_fft(i,x:s),iq1_fft(i+1,x:s));
    r5(i) = R5(1,2);
    p5(i) = P5(1,2);
end

figure;
subplot(2,2,1)

plot(r1)
% plot(p1);
% hold on;
% bar(r1,0.3,'r');
title('Peak 1 on spy camera 1','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)
subplot(2,2,2)
plot(r2);

% plot(p2);
% hold on;
% bar(r2,0.3,'r');
title('Peak 2 on spy camera 1','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)



% figure;
subplot(2,2,3)
plot(r3);

% plot(p3);
% hold on;
% bar(r3,0.3,'r');
title('Peak 1 on spy camera 2','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)
subplot(2,2,4)
plot(r4)

% plot(p4);
% hold on;
% bar(r4,0.3,'r');
title('Peak 2 on spy camera 2','fontsize',21);
xlabel('Num of samples','fontsize',24)
ylabel('coefficient','fontsize',24)
% legend('p-value','t-test','fontsize',21)




for i =2:T-1
    [h,p] = corrcoef(r1(1:i),r2(1:i));
    h12(i) = h(1,2);
    p12(i) = p(1,2);

    [h,p] = corrcoef(r1(1:i),r3(1:i));
    h13(i) = h(1,2);
    p13(i) = p(1,2);    
    
    [h,p] = corrcoef(r1(1:i),r4(1:i));  
    h14(i) = h(1,2);
    p14(i) = p(1,2); 
    
    [h,p] = corrcoef(r2(1:i),r3(1:i));
    h23(i) = h(1,2);
    p23(i) = p(1,2);     
    
    [h,p] = corrcoef(r2(1:i),r4(1:i));
    h24(i) = h(1,2);
    p24(i) = p(1,2); 
    
    [h,p] = corrcoef(r3(1:i),r4(1:i));
    h34(i) = h(1,2);
    p34(i) = p(1,2);

end


figure;
plot(p12);
hold on;
plot(p13);
plot(p14);
plot(p23);
plot(p24);
plot(p34);
legend('p12','p13','p14','p23','p24','p34','fontsize',21)


figure;
plot(h12);
hold on;
plot(h13);
plot(h14);
plot(h23);
plot(h24);
plot(h34);
legend('h12','h13','h14','h23','h24','h34','fontsize',21)





