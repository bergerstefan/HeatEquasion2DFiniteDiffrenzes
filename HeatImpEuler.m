function [u] = HeatImpEuler(u0,tspan)
    
%% A matrix erstellen

h = u0(2)-u0(1);
n = size(u0,2);
e = ones(n,1);
A = spdiags([e -2*e e],-1:1,n,n);
A = h^2 * A;
%% solve Euler
timesteps  = size(tspan,2);
h = tspan(2)- tspan(1);

u = zeros(timesteps, n);

%erster Zeitschritt

u(1,:) = u0 + h  *(A\(u0.'));

for i=2:timesteps
   u(i,:) = u(i-1,:) + h * (A\u(i-1,:)) ;
end

end

