clear all;close all;

%% Parameters and Patterns (Concepts)
load('ind1_bin.mat'); % face 1 
load('ind2_bin.mat'); % face 2 

[N1,N2]=size(ind1);
N=N1*N2; % #neurons
N_patterns=2; % #concepts
time=3; % time range
noise=0.2; %initial noise

ind1_r=reshape(ind1,N,1);
ind2_r=reshape(ind2,N,1);

patterns=[ind1_r ind2_r];

%% Weight matrix
W=patterns*patterns';

%% Initialize network
perturbation=1-noise;
x_states=core_initialize_bin(patterns,perturbation,1);
% initialized with letter 'T'
overlap=zeros(1,time);
overlap(1)=core_overlap_bin(x_states,patterns,1,N);

%% Dynamics
for t=2:time
x_states=core_dynamics_bin(x_states,W);
overlap(t)=core_overlap_bin(x_states,patterns,1,N);
end

%% Visualize results