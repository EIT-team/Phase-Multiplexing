function [A,B] = sepearateSinCos (known_signal, composite)

%Hilbert Transform
H1 = hilbert(known_signal);
H2 = hilbert(composite);

%Calculate phase difference between known signal and composite
phase_diff = angle(H2./H1);
tan_phase = tan(phase_diff);

%Amplitude of composite signal
Demod = abs(H2);

%Sine magnitude
A = sqrt(Demod.^2 ./ (1 + tan_phase.^2));

%Cosine magnitude
B = A .* tan_phase;

end