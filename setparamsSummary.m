function params = setparamsSummary

params.N = 100; % No. of nodes in recurrent netwok

params.nt=1500; % Total number of time steps for simulation for Euler solution
%params.nt = 100; % Total number of time steps in discreet solution 
params.alpha = 2.3; % Excitation parameter
params.beta = [0.02 0.05 0.07 0.1]; % Range of inhibition parameter

params.setsize = [4 8 16 32]; % Number of items used
params.nstim = 20:40:300; % Stimulus duration in msec
%params.nstim = 1:12; % Stimulus duration in time steps

params.noise = 0.03; % Standard deviation of the Gaussian noise
params.nrun = 100; % Total number of simulations run

params.stimLevel = 0.3; % This is the level to which all the inputs are 
                        % clamped to. It can be adjusted to values within
                        % [0, 1].

for iw=1:params.N
    params.ycol(iw)=ceil(iw/sqrt(params.N));
    params.xrow(iw)=iw-(params.ycol(iw)-1)*sqrt(params.N);
end
