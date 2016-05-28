function f=adv_multiple_inj(states_curr,states_init,inj_b,inj_r,inj_c,N)
    
    g=states_curr;

    % simulating FAS
    g=adv_blockage(g,states_init,inj_b,N);
    g=adv_reflection(g,inj_r,N);
    g=adv_confusion(g,inj_c);

    % rescale network states
    scale=max(g);
    scale=scale/8;
    g=round(g./scale);
    

f=g;
