function [A,b] = laplace(n,d)


T = -2*eye(n)+[zeros(n-1,1),eye(n-1);zeros(1,n)]+[zeros(n-1,1),eye(n-1);zeros(1,n)]';

b1 = zeros(n^d,1);
b2 = zeros(n^d,1);
b3 = zeros(n^d,1);
b4 = zeros(n^d,1);

if d == 2
    A = (n+1)^2*(kron(T,eye(n))+kron(eye(n),T));

    b1(1:n) = 0;            %unterer Rand
    b2(1:n:n*(n-1)+1) = 0;  %linker Rand
    b3(n:n:n^2) = 0;        %rechter Rand
    b4(n*(n-1)+1:n^2) = 0;  %oberer Rand 
   
else
if d == 1
    A = (n+1)^2*T;

    b1(1) = 0;
    b2(n) = 0;
end
end

    b = (n+1)^2*(b1+b2+b3+b4);
end

