function f=core_dynamics_mult(states,i,dt,W,mu,I,dB,R)

    % network dynamics
    Binc=sum(dB(R*(i-1)+1:R*i));
    g=states+dt*aux_neuron_activity_mult(states,W,1,I)+mu*states*Binc;

    % rescale network states
    scale=max(g);
    scale=scale/8;
    g=round(abs(g./scale));

f=g;