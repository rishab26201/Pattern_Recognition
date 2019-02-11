X = [-1 -0.9 -0.8 -0.7 -0.6 -0.5 -0.4 -0.3 -0.2 -0.1 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
t = [5.12 4.97 4.92 4.83 4.90 5.06 5.29 5.34 5.36 5.76 5.99 6.30 6.66 6.70 7.49 7.92 8.48 9.09 9.70 10.30 10.98];
x_out = [-0.95 -0.85 -0.75 -0.65 -0.55 -0.45 -0.35 -0.25 -0.15 -0.05 0.05 0.15 0.25 0.35 0.45 0.55 0.65 0.75 0.85 0.95];
g = [5 4.92 4.88 4.88 4.92 5 5.12 5.28 5.48 5.72 6 6.32 6.68 7.08 7.52 8 8.52 9.08 9.68 10.32 11];


A = [];
t_a = [];
a_out = [];
B = [];
t_b = [];
b_out = [];
C = [];
t_c = [];
c_out = [];
t_exp = [];

w_exp_a = [0 0 0];
w_exp_b = [0 0 0];
w_exp_c = [0 0 0];

disp(length(X))
for i = 1:3:length(X)
	A = [A, X(i)];
	t_a = [t_a, t(i)];
end

for i = 2:3:length(X)
	B = [B, X(i)];
	t_b = [t_b, t(i)];
end

for i = 3:3:length(X)
	C = [C, X(i)];
	t_c = [t_c, t(i)];
end

for i =1:3:length(x_out)
	a_out = [a_out, x_out(i)];
end

for i =2:3:length(x_out)
	b_out = [b_out, x_out(i)];
end

for i =3:3:length(x_out)
	c_out = [c_out, x_out(i)];
end


phix_a = A;
phix_a = [phix_a ; exp((-(A-0.5).^2)/0.1)];
phix_a = [phix_a ; exp((-(A+0.5).^2)/0.1)];

phix_b = B;
phix_b = [phix_b ; exp((-(B-0.5).^2)/0.1)];
phix_b = [phix_b ; exp((-(B+0.5).^2)/0.1)];

phix_c = C;
phix_c = [phix_c ; exp((-(C-0.5).^2)/0.1)];
phix_c = [phix_c ; exp((-(C+0.5).^2)/0.1)];

phi_xout_a = a_out;
phi_xout_a = [phi_xout_a ; exp((-(a_out-0.5).^2)/0.1)];
phi_xout_a = [phi_xout_a ; exp((-(a_out+0.5).^2)/0.1)];

phi_xout_b = b_out;
phi_xout_b = [phi_xout_b ; exp((-(b_out-0.5).^2)/0.1)];
phi_xout_b = [phi_xout_b ; exp((-(b_out+0.5).^2)/0.1)];

phi_xout_c = c_out;
phi_xout_c = [phi_xout_c ; exp((-(c_out-0.5).^2)/0.1)];
phi_xout_c = [phi_xout_c ; exp((-(c_out+0.5).^2)/0.1)];

figure(10)
scatter(A,t_a,'filled','b');
title('data1');

figure(11)
scatter(B,t_b,'filled','g');
title('data2');

figure(12)
scatter(C,t_c,'filled','r');
title('data3');

var_reg = [];
bias_reg = [];
for lambda = [0,2,4,5,6,10]

	disp("LAMBDA=");
	disp(lambda);
	%disp("w_exp_a = ");
	w_exp_a = inv(phix_a*transpose(phix_a) + lambda*eye(length(w_exp_a)))*phix_a*transpose(t_a);
	disp(w_exp_a);

	%disp("w_exp_b = ");
	w_exp_b = inv(phix_b*transpose(phix_b) + lambda*eye(length(w_exp_b)))*phix_b*transpose(t_b);
	disp(w_exp_b);

	%disp("w_exp_c = ");
	w_exp_c = inv(phix_c*transpose(phix_c) + lambda*eye(length(w_exp_c)))*phix_c*transpose(t_c);
	disp(w_exp_c);


	disp("w[1][1] = ");
	disp(w_exp_a(1));

	disp("w[2][1] = ");
	disp(w_exp_b(1));

	disp("w[3][1] = ");
	disp(w_exp_c(1));

	hold on
	figure(1)
	plot(A,transpose(w_exp_a)*phix_a);
	title('x train1 vs test 1');
	legend('reg = 0','reg = 2','reg = 4','reg = 5','reg = 6','reg = 10')
	grid
	hold off
	
	hold on
	figure(2)
	plot(a_out,transpose(w_exp_a)*phi_xout_a);
	title('x out vs y out1');
	legend('reg = 0','reg = 2','reg = 4','reg = 5','reg = 6','reg = 10')
	grid
	hold off
	
	hold on
	figure(3)
	plot(B,transpose(w_exp_b)*phix_b);
	title('x train2 vs test 2');
	legend('reg = 0','reg = 2','reg = 4','reg = 5','reg = 6','reg = 10')
	grid
	hold off
	
	hold on
	figure(4)
	plot(b_out,transpose(w_exp_b)*phi_xout_b);
	title('x out vs y out2');
	legend('reg = 0','reg = 2','reg = 4','reg = 5','reg = 6','reg = 10')
	grid
	hold off

	hold on
	figure(5)
	plot(C,transpose(w_exp_c)*phix_c);
	title('x train3 vs test 3');
	legend('reg = 0','reg = 2','reg = 4','reg = 5','reg = 6','reg = 10')
	grid
	hold off
	
	hold on
	figure(6)
	plot(c_out,transpose(w_exp_c)*phi_xout_c);
	title('x out vs y out3');
	legend('reg = 0','reg = 2','reg = 4','reg = 5','reg = 6','reg = 10')
	grid
	hold off
	
	
	t_1 = [];
	t_2 = [];
	t_3 = [];
	t_exp = [];
	c1 = 0;
	c2 = 0;
	c3 = 0;

	t_1 = transpose(w_exp_a)*phix_a;
	t_2 = transpose(w_exp_b)*phix_b;
	t_3 = transpose(w_exp_c)*phix_c;


	for i = 1:length(t)
		if mod(i+2,3)==0
			c1 = c1+1;
			t_exp = [t_exp,t_1(c1)];
		elseif mod(i+1,3)==0
			c2 = c2+1;
			t_exp = [t_exp,t_2(c2)];
		else
			c3 = c3+1;
			t_exp = [t_exp, t_3(c3)];
		end
	end


	mean = 0;
	for i = 1:length(t_exp)
		mean = mean+t_exp(i);
	end
	mean = mean/length(t_exp);

	var = 0;
	bias = 0;
	for i = 1:length(t_exp)
		var = var + (t_exp(i)-mean)^2;
		bias = bias + (g(i)-mean)^2;
	end
	var = var/length(t_exp);
	bias = bias/length(g);

	var_reg = [var_reg, var];
	bias_reg = [bias_reg, bias];
	dis1 = ["VAR with lambda", lambda, " = "];
	dis2 = ["BIAS with lambda", lambda, " = "];
	disp(dis1);
	disp(var);
	disp(dis2);
	disp(bias);

	
end

hold on
figure(15)
plot(var_reg,[0,2,4,5,6,10]);
title('variance vs regularization');
grid
hold off

hold on
figure(16)
plot(bias_reg,[0,2,4,5,6,10]);
title('bias vs regularization');
grid
hold off
