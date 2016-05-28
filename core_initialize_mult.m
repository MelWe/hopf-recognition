function f=core_initialize_mult(patterns,perturbation,original)

    x_states=zeros(length(patterns(:,original)),1);

    for i=1:length(patterns(:,original))
        if rand < perturbation
            x_states(i)=patterns(i,original);
        else 
            r=rand;
            if r < 0.1111
                x_states(i)=0;
            elseif r <0.2222
                x_states(i)=1;
            elseif r <0.3333
                x_states(i)=2;
            elseif r <0.4444
                x_states(i)=3;
            elseif r <0.5555
                x_states(i)=4;
            elseif r <0.6666
                x_states(i)=5;
            elseif r <0.7777
                x_states(i)=6;
            elseif r <0.8888
                x_states(i)=7;
            else
                x_states(i)=8;
            end
        end
    end

f=x_states;