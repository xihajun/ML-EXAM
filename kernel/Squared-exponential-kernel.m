kernel = 1
switch kernel
    case 1; k = @(x,y) exp(-100*(x-y)'*(x-y));
end

x = 0:0.005:1;
n = length(x);

c = zeros(n,n);
for i = 1:n
    for j = 1:n
        C(i,j) = k(x(i),x(j));
    end
end

u = randn(n,1)
[A,S,B] = svd(C);
z = A * sqrt(S) * u;

figure(2); hold on;
plot(x,z,'.-')


