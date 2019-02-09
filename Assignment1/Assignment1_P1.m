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



disp("w_exp_a = ");
w_exp_a = inv(phix_a*transpose(phix_a) + 0*eye(length(w_exp_a)))*phix_a*transpose(t_a);
disp(w_exp_a);

disp("w_exp_b = ");
w_exp_b = inv(phix_b*transpose(phix_b) + 0*eye(length(w_exp_b)))*phix_b*transpose(t_b);
disp(w_exp_b);

disp("w_exp_c = ");
w_exp_c = inv(phix_c*transpose(phix_c) + 0*eye(length(w_exp_c)))*phix_c*transpose(t_c);
disp(w_exp_c);

scatter(A,t_a,'filled');
plot(A,phix_a);
%plot(a_out,phi_xout_a);

t_1 = [];
t_2 = [];
t_3 = [];
t_exp = [];
c1 = 0;
c2 = 0;
c3 = 0;

t_1 = transpose(w_exp_a)*phix_a;
disp(t_1);
disp("TT");
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


disp("TEXP");
disp(t_exp);

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


disp("VAR,BIAS");
disp(var);
disp(bias);




phi_xout_a = a_out;
phi_xout_a = [phi_xout_a ; exp((-(a_out-0.5).^2)/0.1)];
phi_xout_a = [phi_xout_a ; exp((-(a_out+0.5).^2)/0.1)];

phi_xout_b = b_out;
phi_xout_b = [phi_xout_b ; exp((-(b_out-0.5).^2)/0.1)];
phi_xout_b = [phi_xout_b ; exp((-(b_out+0.5).^2)/0.1)];

phi_xout_c = c_out;
phi_xout_c = [phi_xout_c ; exp((-(c_out-0.5).^2)/0.1)];
phi_xout_c = [phi_xout_c ; exp((-(c_out+0.5).^2)/0.1)];

