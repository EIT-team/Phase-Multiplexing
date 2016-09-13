function [sin_signal,cosine_signal] = sepearateSinCos (known_signal, composite)
% SEPARATESINCOS Decompose signal into sin and cos components

num_chans = size(composite,2);
if (num_chans > 1)
    known_signal = repmat(known_signal,1,num_chans);
end

%Hilbert Transform
H1 = hilbert(known_signal);
H2 = hilbert(composite);

%Calculate phase difference between known signal and composite
phase_diff = angle(H2./H1);
tan_phase = tan(phase_diff);

%Amplitude of composite signal
demod = abs(H2);

%Sine magnitude
sin_signal = sqrt(demod.^2 ./ (1 + tan_phase.^2));

%Cosine magnitude
cosine_signal = sin_signal .* tan_phase;

end