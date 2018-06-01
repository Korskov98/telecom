close all;
clear; clc;

f = 20;
fd = f * 40;
td = 1/fd;
tend = 0.5;
phase = 0;
a = 2;
t = 0:td:tend;
s = a*cos(2*pi*f*t+phase);
figure;
plot(t,s);

fmod = 100;
mod = ammod(s, fmod, fd, 5, 5);
figure;
plot(t, mod);
figure;
plot(abs(fft(mod, 1024)));

fmod = 150;
sub_mod = ammod(s, fmod, fd);
figure;
plot(t, sub_mod);
figure;
plot(abs(fft(sub_mod, 1024)));

single_mod = ssbmod(s, fmod, fd);
figure;
plot(t, single_mod);
figure;
plot(abs(fft(single_mod, 1024)));

sign = demod(single_mod, fmod, fd);
figure;
plot(t, sign);
figure;
plot(abs(fft(sign, 1024)));

M = a/5;
kpd = M^2/(M^2+2)