function f=core_initialize_bin(patterns,perturbation,original)

    x_states=zeros(length(patterns(:,original)),1);

    for i=1:length(patterns(:,original))
        if rand < perturbation
            x_states(i)=patterns(i,original);
        else
            if rand < .5
                x_states(i)=1;
            else
                x_states(i)=-1;
            end
        end
    end

f=x_states;