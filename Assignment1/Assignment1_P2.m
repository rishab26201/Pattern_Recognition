X = [-1 -0.9 -0.8 -0.7 -0.6 -0.5 -0.4 -0.3 -0.2 -0.1 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
t = [5.12 4.97 4.92 4.83 4.90 5.06 5.29 5.34 5.36 5.76 5.99 6.30 6.66 6.70 7.49 7.92 8.48 9.09 9.70 10.30 10.98];
x_out = [-0.95 -0.85 -0.75 -0.65 -0.55 -0.45 -0.35 -0.25 -0.15 -0.05 0.05 0.15 0.25 0.35 0.45 0.55 0.65 0.75 0.85 0.95];
g = [5 4.92 4.88 4.88 4.92 5 5.12 5.28 5.48 5.72 6 6.32 6.68 7.08 7.52 8 8.52 9.08 9.68 10.32 11];

w = [0;0;0];

X_t = X(1:14);
Y = X(15:21);

phix = X_t;
phix = [phix ; exp((-(X_t-0.5).^2)/0.1)];
phix = [phix ; exp((-(X_t+0.5).^2)/0.1)];

phiy = Y;
phiy = [phiy ; exp((-(Y-0.5).^2)/0.1)];
phiy = [phiy ; exp((-(Y+0.5).^2)/0.1)];

lr = 1

for k = 1:10
	error = 0
	sse = 0
	for i =1:length(X_t)
		error = t(i)-transpose(w)*phix(:,i);
		disp(error);
		w = w + lr*error*phix(:,i);
	end

	for j = 1:length(Y)
		sse = sse + (t(j)-transpose(w)*phiy(:,j))^2;
	end
end

disp("ERROR=");
disp(error);

disp("SSE=");
disp(sse);

disp("WEIGHTS=");
disp(w);
%disp(length(error));