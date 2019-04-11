A1 = [1.08 0.75 0.85 0.94 0.40 1.25 1.19 0.99 0.69 1.32; 0.08 -0.19 -0.11 0.01 -0.09 -0.21 0.07 0.04 -0.02 0.02]
A2 = [0.01 -0.01 0.09 -0.05 -0.45 0.07 -0.33 -0.06 -0.33 -0.24; 0.85 1.05 0.93 1.41 1.45 1.20 0.88 1.08 1.10 1.01]
A = [A1 A2]
t = [1 1 1 1 1 1 1 1 1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1]

M = []
for i = 1:20
    for j = 1:20
        M(i,j) = kernel(A(:,i),A(:,j))*t(i)*t(j)
    end
end

M = [M;t]
right = [1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0]

a = linsolve(M,right)
%a2 = inv(transpose(M)*M)*transpose(M)*right

M1 = []
M2 = []
w = 0
vec = []
t_new = []

for i = 1:20
    if a(i)<=10 && a(i)>=0
        vec = [vec A(:,i)]
        t_new = [t_new t(i)]
        M2 = [M2 a(i)]
        w = w + a(i)*t(i)*A(:,i)
    end
end

b = 0
for i = 1:20
    if a(i)<10 && a(i)>0
        M1 = [M1 a(i)]
        sum = 0
        for j = 1:length(M2)
            sum = sum + kernel(vec(:,j),A(:,i))*t_new(j)*M2(j)
        end
        b = b + (t(i)-sum)
    end
end

N1 = length(M1)
b = b/N1

hold on
figure(1)
scatter(A1(1,:),A1(2,:))
scatter(A2(1,:),A2(2,:))

x = -1:2
y = -(w(1)*x + b)/w(2)
plot(x,y)

function k = kernel(p,q)
sig = 1
k = transpose(p)*q
%k = exp(-(transpose(p-q)*(p-q))/(2*sig^2))
end