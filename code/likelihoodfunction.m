% The example is from zhihu: https://cloud.tencent.com/developer/article/1097341
% Firstly, let's consider a function y = 3x + noise
% The noise is distributed as gaussian distribution with mean 0, sd 1
% Suppose now we generate data from this function and try to predict the
% coefficient 3.

% Plot
x = [1:10]
% points with noise
y = 5 * x + randn(1,10)
plot(x,y,'*')
hold on;
% real data
plot([1:10],5*[1:10])

% Now we only learn the perameter from x and y
x
y
% We could calculate the likelihood function of cofficient w 
% That is to say we want to calculate P(y|x,w) -- the probability when y given x and w
% P(y = w*x + noise | x and w ) once x and w are given, y is just depend on
% noise
% So we know 
% noise = y - w*x
% In this case, we are able to calculate the P(y|x,w)
% For example
w = 5;
w*x
noise = y - w*x
% The noise points iid gaussian distribution with mean 0, sd 3
% Now we can calculate how likely this situation would happen

% Does tha means we calculate 
% P(noisei >= noise(i) for any i) = P(n1>=n(1))*P(n2>=n2)*... ?
% or noise - small number <= noise <= noise+ small number 
% 计算这个区间的概率 然后由于独立性把概率相乘
p = [];
for w = 1 :0.001:10
    noise = y - w*x;
    p = [p prod(normcdf(noise+1)-normcdf(noise-1))];
end
figure
plot([1:0.001:10],p,'*')


