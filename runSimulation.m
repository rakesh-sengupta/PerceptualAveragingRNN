function params = runSimulation(params, nsetsize, nstim, nbeta, varargin)

% This program solves the dynamical equation till steady state for each 
% simulation. Inputs: params = i/o structure, setsize = number of items for
% current run, nstim = item display duration index for the current run,
% nbeta = inhibition parameter index for the current run. Output = params,
% the i/o structure

if(nargin == 5)
    filtopt = varargin{1};
else
    filtopt = 0;
end

setsize = params.setsize(nsetsize);

x = zeros(params.N, params.nt); % Actvation values initiated
x1 = zeros(params.N, params.nt); % Actvation values initiated
en = zeros(params.N,params.nt); % Energy values initiated
noise = params.noise*abs(randn(params.N, params.nt)); % initialize noise with mean
                                                 % zero and standard
                                                 % deviation = params.noise

a = randperm(params.N);


I = zeros(params.N, params.nt); % Input values initialized
%I1 = zeros(params.N, params.nt); % Input values initialized

% We want the inputs to have a square/gaussian distribution of values
% between the range [0.2 0.4] with the mean being 0.3.

%input_b = linspace(0.1, 0.5, setsize); % Uniform ditribution
input_b = params.stimLevel;
input_array = zeros(params.N,1);
if(filtopt == 0)
    b = a(1:setsize); % Randomized input nodes for each run.
    input_array(b) = input_b;
else
    b = params.b;
    input_array(b) = input_b;
    input_array = reshape(input_array, sqrt(params.N), sqrt(params.N));
%     G = fspecial('gaussian',[3 3],2);
%     input_array = imfilter(input_array, G, 'same');
    G = imgaussfilt(input_array, 0.1);
    input_array = reshape(G, params.N, 1);
end


for i = 1:length(b)
%     input_b(i) = normrnd(0.3, params.noise);   % Normal distribution
%     if((input_b(i) < 0.2) || (input_b(i) > 0.4))
%         if(sign(input_b(i) - 0.2) == -1)
%             input_b(i) = 0.2;
%         else
%             input_b(i) = 0.4;
%         end
%     end
    I(:,1:nstim) = repmat(input_array, 1, nstim);
%     I1(b(i),1:nstim) = params.stimLevel*ones(1,nstim);
end




% alph is the connectivity matrix
alph = params.alpha*eye(params.N) + params.beta(nbeta)*(eye(params.N) - ones(params.N));

% Run teemporal dynamics Euler solution with time step deltaT = 0.01;

for it = 1:params.nt-1
     x((x(:, it) <= 0), it) = 0;
     x(:, it+1) = 0.99*x(:, it) + 0.01*(alph*sumfx(x(:, it)) + I(:, it) + noise(:, it));
%      x1((x(:, it) <= 0), it) = 0;
%      x1(:, it+1) = 0.99*x1(:, it) + 0.01*(alph*sumfx(x1(:, it)) + I1(:, it) + noise(:, it));
     %x(:, it+1) = (alph*sumfx(x(:, it)) + I(:, it)) + noise(:, it);
     %en(:, it+1) = 0.99*en(:, it) - 0.01*((1 - params.alpha*(sumfx(x(:, it+1))./x(:, it+1)).^2).*...
     %    ((alph*sumfx(x(:, it)) + I(:, it) + noise(:, it)).^2));
     %en(:, it+1) = en(:, it) - (1 - params.alpha*(sumfx(x(:, it+1))./x(:, it+1)).^2).*(x(:, it+1).^2);
     
end

params.b = b;

x((x(:, params.nt) <= 0), params.nt) = 0;
params.x = x(:, params.nt);
%params.x1 = x1(:, params.nt);
params.input = input_array;
params.input(find(params.input > 0)) = 1;
newx = x(:, params.nt);
newx(find(newx > 0)) = 1;
newx(find(newx < 0)) = 0;
params.output = newx;
sum(newx);
params.stableno = sum(newx); % No. of nodes active at steady state for this run
%params.en = sum(sum(en)); % Energy calculated for this run

params.inputExact = I(:,1);
params.outputExact = x(:,params.nt);


