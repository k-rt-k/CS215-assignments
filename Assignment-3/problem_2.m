clear;
rng(0);

% true paramters of dataset
lambda_true = 5;

% for gamma prior
alpha = 5.5;
beta = 1;

%sample sizes
N=[5,10,20,40,60,80,100,500,10^3,10^4];

%number of experiments
M=200;

% sample mean 
smean = [];
for n=N
    data = -log(rand(M,n))/lambda_true; %generating the data
    smean = [smean mean(data,2)];
end
%ml
lml = 1./smean;
% posterior mean
lposm = (N+alpha)./(N.*smean+1/beta);

% converting estimates to relative errors
lml = abs(lml-lambda_true)/lambda_true;
lposm = abs(lposm-lambda_true)/lambda_true;
%plot them like the previous some way
boxplot(lml);
boxplot(lposm);