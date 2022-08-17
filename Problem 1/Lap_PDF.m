mu = 2;
b = 2;
int_size = 0.5;
x = -20:int_size:20;
y_pdf = (exp(-abs(x-mu)/b))/2*b;

plot(x, y_pdf), xlabel("x"), ylabel("PDF"), title("Laplace PDF");


