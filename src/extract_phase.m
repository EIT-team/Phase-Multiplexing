
EEG_file = 'base.vhdr'
path  = ''; 
EEG=pop_loadbv(path,EEG_file);
%%
Fs = EEG.srate;
data = double(EEG.data');
clear EEG

%%
bw = 100;
zero_phase = [5 11];

    for freq_index = 1:num_freqs
        Fc = freqs(freq_index);
        [filt.b, filt.a] = butter(5, (Fc + [-bw,bw])./(Fs/2));
        
        X1 = filtfilt(filt.b,filt.a,data);
        
        zero_phase_channel = zero_phase(freq_index);
        
        
        
        first_index = 2*(freq_index-1) + 1;
        second_index = 2*(freq_index-1) + 2;
        [demod{first_index} demod{second_index}] = separateSinCos(X1(:,zero_phase_channel),X1);

    end