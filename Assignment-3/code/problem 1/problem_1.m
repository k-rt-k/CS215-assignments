clear;
rng(0);
%values of N
N = [ 5, 10, 20, 40, 60, 80, 100, 500, 10^3, 10^4];

% true parameters for data generation
true_mean = 10;
std = 4;

% gaussian parameters for prior for map1
meanprior = 10.5;
stdprior=1;

% upper and lower bound for uniform distribution for map2
ulb=9.5;
uub=11.5;

M = 200; %number of experiments for each N
mu_ml = [];% stores the sample means for each - also ML
for n=N
    data = true_mean + std*randn(M,n); % generate data
    mu_ml = [mu_ml mean(data,2)]; %add the sample means
end
% mu_map1 from sample mean
mmap1 = (stdprior^2*N.*mu_ml+std^2*meanprior)./(std^2+N*stdprior^2);
% mu_map2 from sample mean
mmap2 = mu_ml;
mmap2(mmap2<ulb)=ulb;
mmap2(mmap2>uub)=uub; 
% changing estimates to relative errors
mu_ml = abs(mu_ml-true_mean)/true_mean;
mmap1 = abs(mmap1-true_mean)/true_mean;
mmap2 = abs(mmap2-true_mean)/true_mean;
% plotting them

figure
hold on
boxplot(mu_ml,'Colors','b','Widths',0.15,'Positions',(1:10),'Labels',N);
plot(NaN,1,'color',"b");
hold on
boxplot(mmap1,'Colors','r','Widths',0.15,'Positions',(1:10)+0.23,'Labels',N);
plot(NaN,1,'color',"r");
hold on
boxplot(mmap2,'Colors','k','Widths',0.15,'Positions',(1:10)+0.46,'Labels',N);
plot(NaN,1,'color',"k");
ylim([-0.01,0.5]);
xlabel('Sample Size');
ylabel('Relative Errors in Estimates')
hold on
legend({'Maximum Likelihood Estimate','A-Posteriori-Estimate for Gaussian prior','A-Posteriori-Estimate for Uniform prior'})

hold off;