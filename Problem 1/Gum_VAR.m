mu = 1;
b = 2;
int_size = 0.2;

x = -20:int_size:40;
z = (x-mu)/b;
y_pdf = exp(-(z + exp(-z)))/b;


mean_2 = 0;
mean = 0;

for i = 1:length(x)
    mean_2 = mean_2 + ((x(i))^2)*y_pdf(i)*int_size;
    mean = mean + (x(i))*y_pdf(i)*int_size;
end

var = mean_2 - (mean^2);
disp(var);