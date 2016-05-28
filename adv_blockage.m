function f=adv_blockage(states_curr,states_init,inj_index,N)

    dummy=states_curr';
    dummy2=states_init';
    % injury: introduce blockage
    %states_curr(inj_index)=states_init(inj_index);
    dummy(inj_index)=dummy2(inj_index);
    states_curr=dummy';
    
f=states_curr;