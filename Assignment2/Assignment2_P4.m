A1 = [1.08 0.75 0.85 0.94 0.40 1.25 1.19 0.99 0.69 1.32; 0.08 -0.19 -0.11 0.01 -0.09 -0.21 0.07 0.04 -0.02 0.02]
A2 = [0.01 -0.01 0.09 -0.05 -0.45 0.07 -0.33 -0.06 -0.33 -0.24; 0.85 1.05 0.93 1.41 1.45 1.20 0.88 1.08 1.10 1.01]
t = [1 1 1 1 1 0 0 0 0 0;0 0 0 0 0 1 1 1 1 1]
w1 = [0;0]
w2 = [0;0]
cross = 0

for j = 1:5
    y11 = exp(transpose(w1)*A1(:,j))/(exp(transpose(w1)*A1(:,j)) + exp(transpose(w2)*A1(:,j)))
	y12 = exp(transpose(w2)*A1(:,j))/(exp(transpose(w1)*A1(:,j)) + exp(transpose(w2)*A1(:,j)))
    
    y21 = exp(transpose(w1)*A2(:,j))/(exp(transpose(w1)*A2(:,j)) + exp(transpose(w2)*A2(:,j)))
    y22 = exp(transpose(w2)*A2(:,j))/(exp(transpose(w1)*A2(:,j)) + exp(transpose(w2)*A2(:,j)))
    
    cross = cross - (t(1,j)*log(y11) + t(2,j)*log(y12)) - (t(1,5+j)*log(y21) + t(2,5+j)*log(y22)) 
end

error = 0
for i = 1:5
    sum11 = 0
    sum21 = 0
	sum12 = 0
	sum22 = 0
    cross = 0
    for j=1:5
        d1 = exp(transpose(w1)*A1(:,j)) + exp(transpose(w2)*A1(:,j))
		d2 = exp(transpose(w1)*A2(:,j)) + exp(transpose(w2)*A2(:,j))
        y11 = exp(transpose(w1)*A1(:,j))/d1
        y12 = exp(transpose(w2)*A1(:,j))/d1
		y21 = exp(transpose(w1)*A2(:,j))/d2
	    y22 = exp(transpose(w2)*A2(:,j))/d2
		
        cross = cross - (t(1,j)*log(y11) + t(2,j)*log(y12)) - (t(1,5+j)*log(y21) + t(2,5+j)*log(y22)) 
        sum11 = sum11 + 0.1*((t(1,j)-y11)*A1(:,j))
        sum21 = sum21 + 0.1*((t(2,j)-y12)*A1(:,j))
		sum12 = sum12 + 0.1*((t(1,5+j)-y21)*A2(:,j))
		sum22 = sum22 + 0.1*((t(2,5+j)-y21)*A2(:,j))
    end
    w1 = w1 + sum11 + sum12
    w2 = w2 + sum21 + sum22
    
    error = [error;cross]
end

plot(error(2:5,:))

transpose(w1)*[1.25;-0.21]