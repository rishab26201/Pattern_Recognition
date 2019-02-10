X_i = [-1 -0.7 -0.4 -0.1 0.2 0.5 0.8];
V_i = [-0.9 -0.6 -0.3 0 0.3 0.6 0.9];
T_i = [-0.8 -0.5 -0.2 0.1 0.4 0.7 1];
X_o = [5.12 4.83 5.29 5.76 6.66 7.92 9.70];
V_o = [4.97 4.90 5.34 5.99 6.70 8.48 10.30];
T_o = [4.92 5.06 5.36 6.30 7.49 9.09 10.98];

sig = 0.3
M = [];
V_ohat = [];
T_ohat = [];
sse = 0;

for i = 1:length(V_i)
	M = [];
	for j =1:length(X_i)
		M = [M; exp(-(X_i(j)-V_i(i)^2)/(2*sig^2))];
		M = M/sum(M);
		%disp(length(M));
	end
	disp(length(M));
	disp(length(X_o));
	V_ohat = [V_ohat X_o*M];
	T_ohat = [T_ohat T_i*M];
	disp(V_ohat);
end

disp(V_ohat);
sse = (V_o - V_ohat)*transpose(V_o - V_ohat);
disp("SSE=");
disp(sse);

sse2 = (T_o - T_ohat)*transpose(T_o - T_ohat);
disp("SSE2=");
disp(sse2);