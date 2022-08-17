mu = 2;
b = 2;
int_size = 0.05;

x = -30:int_size:30;
y_pdf = (exp(-(abs(x-mu))/b))/(2*b);
y_cdf = zeros(1, length(x));



for i = 1:length(x)
    if i == 1
        y_cdf(i) = y_pdf(i)*int_size;
    else
        y_cdf(i) = y_cdf(i-1) + y_pdf(i)*int_size;
    
    end
end


plot(x, y_cdf), xlabel("x"), ylabel("CDF"), title("Laplace CDF");

