# PerceptualAveragingRNN
This is a work in progress recurrent on-center off-surround neural network module intended to explore human perceptual averaging

1. To run the program just try the following from a matlab or octave terminal. All the .m files should be in the same folder where the command is to be run.
params = model_summary_stat;

2. Save the resulting variable params as a .mat file.

3. To change any simulation parameters see setParamsSummary.m file

4. To plot the results run  
new_summary_plot(<mat_file_name>)

# model_summary_stat

The function model_summary_stat computes performance metrics for a neural network that receives two kinds of inputs - filtered and unfiltered. The filtered input is used for summary, and the unfiltered input is used for individuation.

The function initializes the model parameters by calling setparamsSummary. It then loops through the different combinations of parameters defined in setparamsSummary, which are set size (params.setsize), number of stimuli (params.nstim), and beta values (params.beta).

For each combination of parameters, the function runs the simulation params.nrun times using the runSimulation function. The function then computes three performance metrics:

params.memberPerf: the proportion of stimuli that were correctly identified by the network for each member of the set, averaged across all runs.
params.meanPerf: the correlation between the exact input and output vectors for each member of the set, averaged across all runs.
params.meanPerf1: the euclidean distance between the exact input and output vectors for each member of the set, averaged across all runs.
Finally, the function stores these performance metrics in the appropriate fields of the params struct and returns it.

Note that there are some commented out lines of code in the function that suggest alternative ways of computing the performance metrics.

# runSimulation 

This code defines a function called runSimulation which simulates the dynamics of a recurrent neural network. The function takes in several input arguments, including a structure called params, nsetsize, nstim, nbeta, and an optional input argument varargin.

The function initializes various matrices, including x, x1, en, noise, and I, which are used to store activation values, energy values, noise, and input values, respectively.

The function generates input values that have a square/gaussian distribution of values between the range [0.2 0.4] with the mean being 0.3. The connectivity matrix alph is also defined using the input parameter values params.alpha and params.beta.

The function then simulates the dynamics of the network using a temporal Euler solution with a time step of deltaT = 0.01. The activation values of the network are updated at each time step based on the inputs, the connectivity matrix, and the noise values. The function also calculates the number of active nodes at steady state (params.stableno) and stores the input and output values in the params structure.

Finally, the function returns the updated params structure.
