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


plot(x, y_pdf), xlabel("x"), ylabel("PDF"), title("Cauchy PDF");
