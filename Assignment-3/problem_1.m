clear;
rng(0);
%values of N
N = [ 5, 10, 20, 40, 60, 80, 100, 500, 10^3, 10^4];

% true parameters for data generation
true_mean = 10;
std =10;

% gaussian parameters for prior for map1
meanprior = 10.5;
stdprior=1;

% upper and lower bound for uniform distribution for map2
ulb=9.95;
uub=11.5;

M = 200; %number of experiments for each N
muml = [];% stores the sample means for each - also ML
for n=N
    data = true_mean + std*randn(M,n); % generate data
    muml = [muml mean(data,2)]; %add the sample means
end
% mu_map1 from sample mean
mmap1 = (stdprior^2*N.*muml+std^2*meanprior)./(std^2+N*stdprior^2);
% mu_map2 from sample mean
mmap2 = muml;
mmap2(mmap2<ulb)=ulb;
mmap2(mmap2>uub)=uub;
% changing estimates to relative errors
muml = abs(muml-true_mean)/true_mean;
mmap1 = abs(mmap1-true_mean)/true_mean;
mmap2 = abs(mmap2-true_mean)/true_mean;
% plotting them - plot them properly pls
boxplot(muml);
boxplot(mmap1);
boxplot(mmap2);
