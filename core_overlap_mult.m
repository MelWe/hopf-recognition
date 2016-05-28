function f=core_overlap_mult(states,patterns,original,N)

    dummy=0;
    for i=1:N
        if (abs(states(i)-patterns(i,original)) <= 1)
            dummy=dummy+1;
        end
    end
    overlap=dummy/N;

f=overlap;
