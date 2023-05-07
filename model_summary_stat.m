function params = model_summary_stat

% Central idea - Network receives two kinds of inputs - one filtered and
% one unfiltered. Filtered one for summary, and unfiltered for
% individuation.

params = setparamsSummary;

% Same input to be given to both networks. The grid is made in setparams
% file

for i = 1:length(params.setsize)
    for j = 1:length(params.nstim)
        for k = 1:length(params.beta)
            count1 = 0;
            count2 = 0;
            count3 = 0;
            
            
            for irun = 1:params.nrun
                params = runSimulation(params, i, j, k);
                a = params.inputExact;
                b = params.outputExact;
                aa = ceil(a);
                bb = ceil(b);
                %a = mean(params.outputExact);
                count1 = count1 + sum(xor(aa,bb))/params.setsize(i);
                params = runSimulation(params, i, j, k, 1);
                %a = params.inputExact;
                b = params.outputExact;
                count2 = count2 + corr(a, b);
                %count3 = count3 + pdist2(a',b','cosine');
                count3 = count3 + pdist2(a',b','euclidean');
            end
            params.memberPerf(i, j, k) = count1/params.nrun;
            params.meanPerf(i, j, k) = count2/params.nrun;
            params.meanPerf1(i, j, k) = count3/params.nrun;
            
        end
        j
    end
    i
end
