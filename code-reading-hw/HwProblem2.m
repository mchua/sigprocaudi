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
% File: HwProblem2.m
% Created by: Mike Heinz, Purdue University
% Created on: Feb 13, 2006
% Adapted by Farrah Fayyaz, Purdue University
%
% The comments for this code have been deliberately removed.
% Your job is to go back through and comment the code.
% See http://signalprocessingforaudiologists.wordpress.com/2013/01/14/reading-and-commenting-code-homework-assignment-2/ for more details.


clear  

[signal, SamplingRate_Hz] = wavread('vowel1.wav');
duration_sec = length(signal)/SamplingRate_Hz;
time_sec=(1:length(signal))*duration_sec/length(signal);



figure(1)  
clf

subplot(311)
plot(time_sec, signal, 'r-','LineWidth',2)   
title('Original Waveform: vowel1.wav','FontSize',12)   
ylabel('Amplitude','FontSize',12)  
xlabel('Time (sec)','FontSize',12)   
xlim([0 0.05])

set(gca,'FontSize',12)


[Amplitude_Spectrum, Phase_Spectrum_deg, freq_vector_Hz] = FourierTransform(signal, SamplingRate_Hz);   


subplot(312)
plot(freq_vector_Hz,20*log10(Amplitude_Spectrum),'b','LineWidth',2)
ylabel('Amplitude (dB)','FontSize',12)
xlabel('Frequency (Hz)','FontSize',12)
title('Frequency Spectrum','FontSize',12)
xlim([0 5000])
ylim([-60 0])
set(gca,'FontSize',12)


subplot(313)
plot(freq_vector_Hz,Phase_Spectrum_deg,'bx','MarkerSize',12,'LineWidth',2)
ylabel('Phase_deg','FontSize',12)
xlabel('Frequency (Hz)','FontSize',12)
ylim([-180 180])
xlim([0 5000])
set(gca,'FontSize',12)



orient tall
print -dtiff PS5_Prob5_v1_Heinz
