x = [0.59 1.67 1.42 1.11 1.64 0.39 1.42 1.43 1.45 1.45 0.70 1.21; 0.59 1.73 1.10 1.09 1.79 0.66 1.52 1.52 1.54 1.54 0.81 1.31]

x = transpose(x)
mux1 = 0
mux2 = 0
for i = 1:12
	mux1 = mux1+x(i,1)
	mux2 = mux2+x(i,2)
end
mux1 = mux1/12
mux2 = mux2/12


sumx1 = 0
sumx2 = 0
sumx3 = 0
for i = 1:12
	sumx1 = sumx1 + (x(i,1)-mux1)^2
	sumx2 = sumx2 + (x(i,1)-mux1)*(x(i,2)-mux2)
	sumx3 = sumx3 + (x(i,2)-mux2)^2
end

sumx1 = sumx1/12
sumx2 = sumx2/12
sumx3 = sumx3/12

ex = [sumx1 sumx2; sumx2 sumx3]
cov(x)

[e,lam] = eig(ex)

%lambda not interchanged


temp1 = e(:,1)
e(:,1) = e(:,2)
e(:,2) = temp1

x = transpose(x)
y_p = transpose(e)*x

x1_hat = e(:,1)*y_p(1,:) + e(:,2)*y_p(2,:)
x2_hat = e(:,1)*y_p(1,:)


%figure(1)
%hold on
scatter(x(1,:),x(2,:))
%o = [0 0];
%quiver(o(1,1), o(1,2), e(1,1), e(2,1))
%quiver(o(1,1), o(1,2), e(1,2), e(2,2))

%hold off

