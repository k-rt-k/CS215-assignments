x_0 = 0;
gam = 1;
p = pi;

int_size = 0.1;

x = -15:int_size:15;
z = 1+((x-x_0)/gam).^2;

y_pdf = zeros(length(z));
for i = 1:length(z)
    y_pdf(i) = 1/(p*gam*z(i));
end

y_cdf = zeros(1, length(x));

for i = 1:length(x)
    if i == 1
        y_cdf(i) = y_pdf(i)*int_size;
    else
        y_cdf(i) = y_cdf(i-1) + y_pdf(i)*int_size;
    end
end

plot(x, y_cdf), xlabel("x"), ylabel("CDF"), title("Cauchy CDF");
