function A=threshold_quiet(f)
%f=linspace(0.02*1000,20*1000,1000);
A= 3.64*(f/1000).^(-0.8) - 6.5*exp(-0.6*((f/1000)-3.3).^2)+10^(-3)*(f/1000).^4;
%plot(log10(f),A)
end