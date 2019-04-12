A1 = [1.08 0.75 0.85 0.94 0.40 1.25 1.19 0.99 0.69 1.32; 0.08 -0.19 -0.11 0.01 -0.09 -0.21 0.07 0.04 -0.02 0.02]
A2 = [0.01 -0.01 0.09 -0.05 -0.45 0.07 -0.33 -0.06 -0.33 -0.24; 0.85 1.05 0.93 1.41 1.45 1.20 0.88 1.08 1.10 1.01]
t = [1 1 1 1 1 0 0 0 0 0;0 0 0 0 0 1 1 1 1 1]
train = []
valid = []
for i = 1:5
    train = [train A1(:,i)]
    valid = [valid A1(:,5+i)]
end

for i = 1:5
    train = [train A2(:,i)]
    valid = [valid A2(:,5+i)]
end

w1 = [0;0]
w2 = [0;0]
cross = 0

error = []
for i = 1:10
    cross = 0
    for j = 1:10
        d = exp(transpose(w1)*train(:,j)) + exp(transpose(w2)*train(:,j))
        y1 = exp(transpose(w1)*train(:,j))/d
        y2 = exp(transpose(w2)*train(:,j))/d
        cross = cross - (t(1,j)*log(y1) + t(2,j)*log(y2))

        w1 = w1 + 0.1*train(:,j)*(t(1,j)-y1)
        w2 = w2 + 0.1*train(:,j)*(t(2,j)-y2)
    end
    error = [error cross]
end

plot(error)
y_out = []

for i = 1:10
    d = exp(transpose(w1)*valid(:,i)) + exp(transpose(w2)*valid(:,i))
    y_out(1,i) = exp(transpose(w1)*valid(:,i))/d
    y_out(2,i) = exp(transpose(w2)*valid(:,i))/d
end

y_out