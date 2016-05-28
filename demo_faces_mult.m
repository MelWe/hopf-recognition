clear all;close all;

stream = RandStream('mt19937ar','Seed',sum(100*clock));
RandStream.setDefaultStream(stream);

%% Parameters and Patterns (Concepts)
load('ind1_mult.mat'); % face 1
load('ind2_mult.mat'); % face 2

[N1,N2]=size(ind1);
N=N1*N2; % number of neurons
M=2; % number of concepts
time=2; % time range
dt=0.01; % time step
t=0:dt:(time*dt);
noise=0.2; %initial noise
I=zeros(N,1); % stimuli, default

%Brownian Motion (setup)
randn(100);
mu=1000; % intensity of Brownian motion
Xzero=0;
T=1;
R=4;
Dt=R*dt;
L=N/R;

ind1=(ind1/32)*32;
ind1=double(ind1);
ind1_r=reshape(ind1,N,1);

ind2=(ind2/32)*32;
ind2=double(ind2);
ind2_r=reshape(ind2,N,1);

%% Convert to grayscales
for i=1:length(ind1_r)
    switch ind1_r(i)
        case 0
            ind1_r(i)=0;
        case 32
            ind1_r(i)=1;
        case 64
            ind1_r(i)=2;
        case 96
            ind1_r(i)=3;
        case 128
            ind1_r(i)=4;
        case 160
            ind1_r(i)=5;
        case 192
            ind1_r(i)=6;
        case 224
            ind1_r(i)=7;
        case 255
            ind1_r(i)=8;
    end

    switch ind2_r(i)
        case 0
            ind2_r(i)=0;
        case 32
            ind2_r(i)=1;
        case 64
            ind2_r(i)=2;
        case 96
            ind2_r(i)=3;
        case 128
            ind2_r(i)=4;
        case 160
            ind2_r(i)=5;
        case 192
            ind2_r(i)=6;
        case 224
            ind2_r(i)=7;
        case 255
            ind2_r(i)=8;
    end
end

%% Weight matrix
patterns=[ind1_r,ind2_r];
W=patterns*patterns';

%% Initialize network
perturbation=1-noise;
original=1; % initialized with face 1
x_states=core_initialize_mult(patterns,perturbation,original);
overlap=zeros(2,time);
overlap(1,1)=core_overlap_mult(x_states,overlap(1),patterns,1,N);
overlap(2,1)=core_overlap_mult(x_states,overlap(1),patterns,2,N);

%% Dynamics
dB=sqrt(dt)*randn(1,N); % Brownian increament
B=cumsum(dB);           % discretizied Brownian path
results=zeros(length(x_states),time);
    results(:,1)=x_states;
    
for i=2:time
    results(:,i)=core_dynamics_mult(results(:,i-1),i,dt,W,mu,I,dB,R);
        % network dynamics
    overlap(1,i)=core_overlap_mult(results(:,i),overlap(i-1),patterns,1,N);
    overlap(2,i)=core_overlap_mult(results(:,i),overlap(i-1),patterns,2,N);
end

%% Visualize results




