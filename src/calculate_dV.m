function [dV] = calculate_dV(baseline, perturbation, sim_baseline)

%%
%basic error checking
if size(sim_baseline,1) ~= size(baseline,1)
    error('Size mismatch between simulated and experimental')
end

%%
dV = perturbation - baseline;

%Flip sign dV according to the simulated baseline, if it has been given as
%an argument
if sim_baseline
        dV( sim_baseline < 0) = - dV(sim_baseline < 0);
end

end