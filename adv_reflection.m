function f=adv_reflection(states,inj_index,N)

    dummy=states';
    % injury: introduce refelction
    %states(inj_index)=round(0.5.*states(inj_index));
    dummy(inj_index)=floor(0.5.*dummy(inj_index));
    states=dummy';
    
f=states;