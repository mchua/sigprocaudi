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
% File: FourierTransform.m
% Created by: Mike Heinz, Purdue University
% Created on: Feb 13, 2006
%
% Usage: [Amplitude_Spectrum, Phase_Spectrum_deg, freq_vector_Hz] = FourierTransform(signal, SamplingRate_Hz)
%
% This function calculates the Fourier Transform (Amplitude and Phase spectra) for a given waveform and sampling rate.
% 
% Input Parameters:
%   signal: waveform (any units)
%   SamplingRate_Hz: sampling rate (in samples per sec, i.e., Hz)
%
% Output Variables:
%   Amplitude_Spectrum: (in same units as Amplitude)
%   Phase_Spectrum_deg: (in degrees)
%   freq_vector_Hz: frequency vector (in Hz)
%

function [Amplitude_Spectrum, Phase_Spectrum_deg, freq_vector_Hz] = FourierTransform(signal, SamplingRate_Hz)

%%% FFT
FourierTransf=fft(signal);
Nfft=length(FourierTransf);
Amplitude_Spectrum=abs(FourierTransf)/Nfft;   % Need to normalize by number of points in FFT
Phase_Spectrum_deg=angle(FourierTransf)/(2*pi)*360;
freq_vector_Hz=(0:Nfft-1)*SamplingRate_Hz/Nfft;

% Take away negative frequencies
freq_inds=find(freq_vector_Hz <= SamplingRate_Hz/2);
Amplitude_Spectrum=Amplitude_Spectrum(freq_inds);
Amplitude_Spectrum(2:end)=Amplitude_Spectrum(2:end)*2;
Phase_Spectrum_deg=Phase_Spectrum_deg(freq_inds);
freq_vector_Hz=freq_vector_Hz(freq_inds);
zero_inds=find(Amplitude_Spectrum<0.01*max(Amplitude_Spectrum));
Phase_Spectrum_deg(zero_inds)=NaN;

