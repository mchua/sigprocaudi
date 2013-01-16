% Copyright 2006 Mike Heinz
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
% --------------------------------------------------------------------
%
% File: HwProblem1.m
% Created by: Mike Heinz, Purdue University
% Created on: Feb 13, 2006
% Adapted by Farrah Fayyaz, Purdue University
%
% The comments for this code have been deliberately removed.
% Your job is to go back through and comment the code.
% See http://signalprocessingforaudiologists.wordpress.com/2013/01/14/reading-and-commenting-code-homework-assignment-2/ for more details.

clear  

Harmonics = 1:15;
Fundamental_Hz = 100;
Sig_freqs_Hz = Fundamental_Hz * Harmonics;
Out_Amp_dB = 20*log10(1./Harmonics);
Out_Phase_deg = -90 * ones(size(Sig_freqs_Hz));


Sys_BYHAND_freqs_Hz = [100 450 900 1800];
Sys_BYHAND_Amp_dB   = [  0   0 -12  -24];
Sys_BYHAND_Phase_deg= [  0   0 -90  -90];

Slope_dBoct = -12; 
Cutoff_Hz=450;

Sys_freqs_Hz = Sig_freqs_Hz;
for i = 1:length(Sys_freqs_Hz)
        if Sys_freqs_Hz(i) <=Cutoff_Hz
                Sys_Amp_dB(i) = 0;
                Sys_Phase_deg(i) = 0;
        else
                Sys_Amp_dB(i) = Slope_dBoct * log2(Sys_freqs_Hz(i)/Cutoff_Hz);
                Sys_Phase_deg(i) = -90;
        end
end


In_Amp_dB = Out_Amp_dB-Sys_Amp_dB;
In_Phase_deg = Out_Phase_deg-Sys_Phase_deg;


figure(1); clf  

subplot(325)
semilogx(Sig_freqs_Hz,Out_Amp_dB,'-x','Linewidth',2,'MarkerSize',12)
title('OUTPUT Signal Spectrum','FontSize',14)
grid on
xlabel('Frequency (Hz)','FontSize',14)
ylabel('Amplitude (dB re 3V)','FontSize',14)
ylim([-20 0])
xlim([100 1000])
set(gca,'XTickLabel',[100 1000])
set(gca,'FontSize',14)

subplot(323)
semilogx(Sys_BYHAND_freqs_Hz,Sys_BYHAND_Amp_dB,'r','Linewidth',2)
hold on
semilogx(Sys_freqs_Hz,Sys_Amp_dB,'bx','Linewidth',2,'MarkerSize',12)
title('SYSTEM Amplitude Response','FontSize',14)
grid on
ylabel('Gain (dB)','FontSize',14)
ylim([-20 0])
xlim([100 1000])
set(gca,'XTickLabel',[100 1000])
set(gca,'FontSize',14)

subplot(321)
semilogx(Sig_freqs_Hz,In_Amp_dB,'-x','Linewidth',2,'MarkerSize',12)
title('INPUT Signal Spectrum = Out_dB(f) - A_dB(f)','FontSize',14)
ylabel('Amplitude (dB re 3V)','FontSize',14)
grid on
ylim([-20 0])
xlim([100 1000])
set(gca,'XTickLabel',[100 1000])
set(gca,'FontSize',14)


% Column 2 shows values in linear units
subplot(326)
semilogx(Sig_freqs_Hz,10.^(Out_Amp_dB/20)*3,'-x','Linewidth',2,'MarkerSize',12)
title('OUTPUT Signal Spectrum','FontSize',14)
grid on
xlabel('Frequency (Hz)','FontSize',14)
ylabel('Amplitude (Volts)','FontSize',14)
ylim([0 3])
xlim([100 1000])
set(gca,'XTickLabel',[100 1000])
set(gca,'FontSize',14)

subplot(324)
semilogx(Sys_freqs_Hz,10.^(Sys_Amp_dB/20),'bx-','Linewidth',2,'MarkerSize',12)
title('SYSTEM Amplitude Response','FontSize',14)
grid on
ylabel('Gain','FontSize',14)
ylim([0 1])
xlim([100 1000])
set(gca,'XTickLabel',[100 1000])
set(gca,'FontSize',14)

subplot(322)
semilogx(Sig_freqs_Hz,10.^(In_Amp_dB/20)*3,'-x','Linewidth',2,'MarkerSize',12)
title('INPUT Signal Spectrum = Out(f) / A(f)','FontSize',14)
ylabel('Amplitude (Volts)','FontSize',14)
grid on
ylim([0 3])
xlim([100 1000])
set(gca,'XTickLabel',[100 1000])
set(gca,'FontSize',14)

orient landscape
print -dtiff PS6_Prob1A_Heinz


figure(2); clf   % Phase - Exercise 5
subplot(313)
semilogx(Sig_freqs_Hz,Out_Phase_deg,'-x','Linewidth',2,'MarkerSize',12)
title('OUTPUT Signal Spectrum','FontSize',14)
grid on
xlabel('Frequency (Hz)','FontSize',14)
ylabel('Phase (deg)','FontSize',14)
ylim([-180 180])
xlim([100 1000])
set(gca,'XTickLabel',[100 1000])
set(gca,'FontSize',14)

subplot(312)

semilogx(Sys_freqs_Hz,Sys_Phase_deg,'bx','Linewidth',2,'MarkerSize',12)
title('SYSTEM Phase Response','FontSize',14)
grid on
ylabel('Phase (deg)','FontSize',14)
ylim([-180 180])
xlim([100 1000])
set(gca,'XTickLabel',[100 1000])
set(gca,'FontSize',14)

subplot(311)
semilogx(Sig_freqs_Hz,In_Phase_deg,'-x','Linewidth',2,'MarkerSize',12)
title('INPUT Signal Spectrum = Out(f) - P(f)','FontSize',14)
ylabel('Phase (deg)','FontSize',14)
grid on
ylim([-180 180])
xlim([100 1000])
set(gca,'XTickLabel',[100 1000])
set(gca,'FontSize',14)


orient tall
print -dtiff PS6_Prob1B_Heinz
