function y= threshold_2(f1,f2,spl1,spl2,x)
% masking line as triangle side
coefficients = polyfit([f1, f2], [spl1, spl2], 1);
a = coefficients (1);
b = coefficients (2);
y = a*x+b;
end