clc;
close all;
clear all;
x = audiorecorder(8000,8,1)
disp('Start speaking.')
recordblocking(x, 10);
disp('End of Recording.')
play(x);
y = getaudiodata(x);
subplot(4,1,1);
plot(y);
title('INPUT AUDIO')
folder=uigetdir(path,'Save the file');
file=input('Enter the File Name:','s');
filename=strcat(file,'.wav');
filename=strcat(folder,'\',filename);
disp('The path for the saved file:');
disp(filename);
audiowrite(filename,y,10000);
[z,Fs]=audioread(filename);
get(x)
fs=8000;
t=[1:10*fs]'/fs;
fc=2000;
Ac=10;
wc=2*pi*fc*t;
c=Ac*cos(wc);
k=menu('Select the type of Modulation','Amplitude Modulaion','Frequency Modulation');
switch k
    case 1
        a=modulate(y,fc,fs,'am');
        b=demod(a,fc,fs,'am');
        subplot(4,1,1);
        plot(t',y);
        xlabel('Time');
        ylabel('magnitude');
        title('INPUT AUDIO')
        subplot(4,1,2);
        plot(t(1:200),c(1:200))
        xlabel('Time');
        ylabel('magnitude');
        title('CARRIER SIGNAL');
        subplot(4,1,3);
        plot(t',a)
        xlabel('Time');
        ylabel('magnitude');
        title('AMPLITUDE MODULATED SIGNAL');
        subplot(4,1,4);
        plot(t',b)
        xlabel('Time');
        ylabel('magnitude');
        title('AMPLITUDE DEMODULATED SIGNAL');
        pause(5);
        sound(b)
    case 2
        a=modulate(z,fc,fs,'fm');
        b=demod(a,fc,fs,'fm');
        subplot(4,1,1);
        plot(t',y);
        xlabel('Time');
        ylabel('magnitude');
        title('INPUT AUDIO')
        subplot(4,1,2);
        plot(t(1:200),c(1:200))
        xlabel('Time');
        ylabel('magnitude');
        title('CARRIER SIGNAL');
        subplot(4,1,3);
        plot(t',a)
        xlabel('Time');
        ylabel('magnitude');
        title('FREQUENCY MODULATED SIGNAL');
        subplot(4,1,4);
        plot(t',b)
        xlabel('Time');
        ylabel('magnitude');
        title('FREQUENCY DEMODULATED SIGNAL');
        pause(5);
        sound(b)
end
        


