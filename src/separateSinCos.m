function [A,B] = sepearateSinCos (known_signal, composite)

%Hilbert Transform
H1 = hilbert(known_signal);
H2 = hilbert(composite);

phase_diff = angle(H2./H1);

tan_phase = tan(phase_diff);

Demod = abs(H2);

A = sqrt(Demod.^2 ./ (1 + tan_phase.^2));

B = A .* tan_phase;

end