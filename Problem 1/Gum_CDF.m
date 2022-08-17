mu = 1;
b = 2;
int_size = 0.2;

x = -10:int_size:20;
z = (x-mu)/b;
y_pdf = exp(-(z + exp(-z)))/b;
y_cdf = zeros(1, length(x));


for i = 1:length(x)
    if i == 1
        y_cdf(i) = y_pdf(i)*int_size;
    else
        y_cdf(i) = y_cdf(i-1) + y_pdf(i)*int_size;
    end
end

plot(x, y_cdf), xlabel("x"), ylabel("CDF"), title("Gumbel CDF");
