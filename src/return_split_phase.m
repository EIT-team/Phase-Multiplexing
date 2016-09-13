function [demod, BV, vector_BV] = return_split_phase(data,freqs,bw,zero_phase,Fs,prt)

num_freqs = size(freqs,2);
num_prt = size(prt,1);
num_elecs = size(data,2);


    for freq_index = 1:num_freqs
        Fc = freqs(freq_index);
        [filt.b, filt.a] = butter(5, (Fc + [-bw,bw])./(Fs/2));
        
        X1 = filtfilt(filt.b,filt.a,data);
        
        zero_phase_channel = zero_phase(freq_index);
        
        
        first_index = 2*(freq_index-1) + 1;
        second_index = 2*(freq_index-1) + 2;
        [demod{first_index} demod{second_index}] = separateSinCos(X1(:,zero_phase_channel),X1);
        
    end
    
    for i = 1:size(demod,2)
        BV(i,:) = abs(mean(demod{i}(end/10:9*end/10,:)));
    end
    
    %Convert BVs from array to vector
    vector_BV = 1e-6*cell2mat(arrayfun(@(i)BV(i,setdiff(1:num_elecs,prt(i,:))),1:num_prt,...
        'UniformOutput',false))';
end