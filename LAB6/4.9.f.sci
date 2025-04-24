// Scilab script for (f)
clf;
N = 1000;
omega = linspace(-%pi, %pi, N);
X = zeros(1,N);

for k=1:N
    w = omega(k);
    s = 0;
    for n=-4:4
       s = s + (2 - (1/2)^n)*exp(-%i*w*n);
    end
    X(k) = s;
end

magX = abs(X);
phaX = atan(imag(X)./real(X)); 

subplot(211)
plot(omega, magX);
title("|X(e^{jω})| for (f)");
xlabel("ω"); ylabel("Magnitude");

subplot(212)
plot(omega, phaX);
title("∠X(e^{jω}) for (f)");
xlabel("ω"); ylabel("Phase");
