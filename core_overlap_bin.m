function f=core_overlap_bin(states,patterns,original,N)

    f=(states'*patterns(:,original))./N;
