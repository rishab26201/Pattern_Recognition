A1 = [1.08 0.75 0.85 0.94 0.40 1.25 1.19 0.99 0.69 1.32; 0.08 -0.19 -0.11 0.00 -0.09 -0.21 0.07 0.04 -0.02 0.02]
A2 = [0.01 -0.01 0.09 -0.05 -0.45 0.07 -0.33 -0.06 -0.33 -0.24; 0.85 1.05 0.93 1.41 1.45 1.20 0.88 1.08 1.10 1.01]

c1 = [0;0]
c2 = [0;0]
c = [0;0]
for i=1:10
    c1 = c1+A1(:,i)
    c2 = c2+A2(:,i)
    c = c+A1(:,i)+A2(:,i)
end

c1 = c1/10
c2 = c2/10
c = c/10

sb = (c-c1)*transpose(c-c1) + (c-c2)*transpose(c-c2)
sb = sb/2

A1 = transpose(A1)
A2 = transpose(A2)

cov1 = cov(A1)
cov2 = cov(A2)

A1 = transpose(A1)
A2 = transpose(A2)

sw = 0.05*(10*cov1 + 10*cov2)

new = inv(sw)*sb
[e, lam] = eig(new)

temp = e(:,1) 
e(:,1) = e(:,2)
e(:,2) = temp

temp = lam(1,1)
lam(1,1) = lam(2,2)
lam(2,2) = temp

A = [A1, A2]
y_lda = transpose(e)*A

x1_hat = e(:,1)*y_lda(1,:) + e(:,2)*y_lda(2,:)
x2_hat = e(:,1)*y_lda(1,:)
