function f=adv_reflection(states,inj_index,N)

    dummy=states';
    dummy(inj_index)=floor(0.5.*dummy(inj_index));
    states=dummy';
    
f=states;