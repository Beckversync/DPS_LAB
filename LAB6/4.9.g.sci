clf;
N = 1000;
omega = linspace(-%pi, %pi, N);
X = zeros(1,N);

for k=1:N
    w = omega(k);
    // -2 e^{j2w} -1 e^{j w} + 1 e^{-j w} + 2 e^{-j 2w}
    X(k) = -2*exp(%i*2*w) - exp(%i*w) + exp(-%i*w) + 2*exp(-%i*2*w);
end

magX = abs(X);
phaX = atan(imag(X), real(X)); // hoặc phaX = phase(X);

subplot(211)
plot(omega, magX);
title("|X(e^{j\omega})| for (g)");
xlabel("\omega"); ylabel("|X|");

subplot(212)
plot(omega, phaX);
title("Phase of X(e^{j\omega}) for (g)");
xlabel("\omega"); ylabel("phase");
