mu = 1;
b = 2;
int_size = 0.2;
x = -10:int_size:30;
z = (x-mu)/b;
y_pdf = exp(-(z + exp(-z)))/b;

plot(x, y_pdf), xlabel("x"), ylabel("PDF"), title("Gumbel PDF");