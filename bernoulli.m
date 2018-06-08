function[e] = bernoulli(~, N, A, B)

x = zeros(1,N);

x(1) = A;
r = B;
for i = 1:N
x(i+1) = mod(r*(x(i)),1);%rumus bernoulli
end
x(2)
x(3)
c=abs(x);
for j = 1:N+1
    c(j) = c(j)*10000;
end
c=floor(c);
c=mod(c,256);
d=uint8(c);
for i = 1:N
    e(i,:)=d(i);
end