%% gain function
function f=aux_gain_step(x)

    if(x>=0)
        g=1;
    else
        g=-1;
    end

f=g;