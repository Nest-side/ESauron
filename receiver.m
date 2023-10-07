clc;clear;close all;
 
sample_Frame = 2^14;
Duration = 27;
rx_SDRu = comm.SDRuReceiver(...
              'Platform','B210', ...
              'SerialNum','20BR12D', ...
              'SamplesPerFrame',sample_Frame,...
              'CenterFrequency',850e6, ...
              'MasterClockRate',32e6, ...
              'DecimationFactor',1,...
              'Gain',70, ...
              'OutputDataType','double');

 sampleRate = rx_SDRu.MasterClockRate/rx_SDRu.DecimationFactor; % Calculate baseband sample rate  
 FrameDuration = rx_SDRu.SamplesPerFrame/sampleRate;
%  num = sampleRate*t/sample_Frame;
 num = Duration/FrameDuration;


rx_log = dsp.SignalSink('Decimation',1);
data1 = rx_SDRu();
% [data1,dataLen,timeStamps] = rx_SDRu();

rx_log(complex(data1));
% subplot(121);
% log=rx_log.Buffer;
% plot(real(log));title('null');
pause(1);
data2 = rx_SDRu();
rx_log(complex(data2));

% subplot(122);
% log=rx_log.Buffer;
% plot(real(log(sample_rate:end)));title('unknow');


h = animatedline('Color','r','LineWidth',3);
title('RSSI','fontsize',18);
xlabel('Time','fontsize',18)
ylabel('Amplitude(dBm)','fontsize',18)
set(gca,'Xtick',0:5*sampleRate/sample_Frame:num);
set(gca,'Xticklabel',0:5:Duration);

% ylim([-14 7]);

RSSI_mean = [];
time_stamp = [];
% nosmooth_RSSI = [];
RSSI_max = [];
for counter = 1: num
  data = rx_SDRu();
  RSSI = 10*log10(abs(data));
  RSSI(find(isinf(RSSI)))= [];
  
  RSSI_m = mean(RSSI,1,'omitnan');
    
  RSSI_mean = [RSSI_mean RSSI_m];
 ddd = counter*FrameDuration

 
  RSSI_mean = smoothdata( RSSI_mean , 'movmean' , 20 ,'omitnan');

 addpoints(h,counter,RSSI_mean(counter)); 
  drawnow limitrate

end


release(rx_SDRu);
release(rx_log);
