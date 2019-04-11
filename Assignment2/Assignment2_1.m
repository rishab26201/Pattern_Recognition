x = [0.67 0.71 0.48 0.72 0.29 0.89 -1.07 -2.94 0.33 1.38; -1.20 1.63 1.03 -0.3 -0.78 -1.15 -0.81 1.44 -0.75 -1.71]
m = [0.5 0.5]
c = [0.9 0.1; 0.1 0.9]
[e,d] = eig(c)
d = d^0.5
y = e*(d)*x
y = transpose(y)
mu1 = 0
mu2 = 0
for i = 1:10
	mu1 = mu1+y(i,1)
	mu2 = mu2+y(i,2)
end
mu1 = mu1/10
mu2 = mu2/10


sum1 = 0
sum2 = 0
sum3 = 0
for i = 1:10
	sum1 = sum1 + (y(i,1)-mu1)^2
	sum2 = sum2 + (y(i,1)-mu1)*(y(i,2)-mu2)
	sum3 = sum3 + (y(i,2)-mu2)^2
end

sum1 = sum1/10
sum2 = sum2/10
sum3 = sum3/10

exp = [sum1 sum2; sum2 sum3]
cov(y)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%   dunno y i did this??


x = transpose(x)
mux1 = 0
mux2 = 0
for i = 1:10
	mux1 = mux1+x(i,1)
	mux2 = mux2+x(i,2)
end
mux1 = mux1/10
mux2 = mux2/10


sumx1 = 0
sumx2 = 0
sumx3 = 0
for i = 1:10
	sumx1 = sumx1 + (x(i,1)-mux1)^2
	sumx2 = sumx2 + (x(i,1)-mux1)*(x(i,2)-mux2)
	sumx3 = sumx3 + (x(i,2)-mux2)^2
end

sumx1 = sumx1/10
sumx2 = sumx2/10
sumx3 = sumx3/10

ex = [sumx1 sumx2; sumx2 sumx3]
cov(x)

[e,lam] = eig(ex)

x = transpose(x)
y_p = transpose(e)*x


x_1d_1 = transpose(e(:,1))*x
x_1d_2 = transpose(e(:,2))*x


x1_hat = e(:,1)*y_p(1,:) + e(:,2)*y_p(2,:)
x2_hat = e(:,1)*y_p(1,:)


%figure(1)
%hold on
%scatter(x(1,:),x(2,:))
%o = [0 0];
%quiver(o(1,1), o(1,2), e(1,1), e(2,1))
%quiver(o(1,1), o(1,2), e(1,2), e(2,2))

%hold off
