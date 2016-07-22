%test separateSinCos

%setup
addpath('../src')
%% Generate Test Signals
Fs = 20000;
Fc = 1000;

end_t = 5*1/Fc - 1/Fs;

x = (0:1/Fs:end_t);

Mag_X1 = 2;
Mag_X2 = 3;

X1 = Mag_X1*sin(2*pi*Fc*x);
X2 = Mag_X2*cos(2*pi*Fc*x);

C = X1 + X2; %Combine signals


%% Separate out signals

[Y1 Y2] = separateSinCos(X1,C);


% Test results
assert ( isempty(find((int8(Y1) == Mag_X1)==0)) )
assert ( isempty(find((int8(Y2) == Mag_X2)==0)) )
  


