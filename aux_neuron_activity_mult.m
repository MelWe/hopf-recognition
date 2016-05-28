function f=aux_neuron_activity_mult(x, weights, tau, I)
   
   dx=zeros(length(x),1);
   
   for k=1:length(x)
        sum=0;
        for j=1:length(x)
            sum=sum+weights(k,j)*aux_gain_sigmoid(x(j));
        end
        dx(k)=-x(k)/tau + sum + I(k);
   end
   
f=dx;
   