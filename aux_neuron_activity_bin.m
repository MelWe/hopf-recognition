function f=aux_neuron_activity_bin(t, x, weights, tau, I)
   
   dx=zeros(length(x),1);
   
   for i=1:length(x)
        sum=0;
        for j=1:length(x)
            sum=sum+weights(i,j)*aux_gain_step(x(j));
        end
        dx(i)=-x(i)/tau + sum + I(i);
   end
   
f=dx;
   