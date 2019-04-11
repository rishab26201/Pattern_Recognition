A1 = [1.08 0.75; 0.08 -0.19]
A2 = [0.01 0.09; 0.85 0.93]
A = [A1 A2]

G = []
for i = 1:4
    for j = 1:4
        G(i,j) = kernel(A(:,i),A(:,j))
    end
end

A1 = []
A2 = []

for i = 1:2
    A1 = [A1 G(:,i)]
    A2 = [A2 G(:,2+i)]
end

A = [A1 A2]

c1 = zeros(4)
c2 = zeros(4)
c = zeros(4)

for i = 1:2
    c1 = c1 + A1(:,i)
    c2 = c2 + A2(:,i)
end

c1 = c1/2
c2 = c2/2

c = (c1+c2)/2

sb = 0.5*(transpose(c-c1)*(c-c1) + transpose(c-c2)*(c-c2))

A1 = transpose(A1)
A2 = transpose(A2)

cov1 = cov(A1)
cov2 = cov(A2)

A1 = transpose(A1)
A2 = transpose(A2)

sw = 0.25*(2*cov1 + 2*cov2)

new = inv(sw)*sb
[e, lam] = eigs(new,4)

y = transpose(e)*A



function k = kernel(p,q)
sig = 1
k = exp(-(transpose(p-q)*(p-q))/(2*sig^2))
end