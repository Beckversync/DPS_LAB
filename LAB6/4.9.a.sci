// Ví dụ mã Scilab phác hoạ phổ cho câu (a)
clf;
N = 1000;
omega = linspace(-%pi, %pi, N);  // quét tần số từ -pi đến pi
X = zeros(1,N);

for k=1:N
    w = omega(k);
    // Tính tổng hữu hạn x(n)*exp(-j*w*n), n=0..5
    s = 0;
    for n=0:5
       s = s + exp(-%i*w*n);
    end
    X(k) = s;
end

magX = abs(X);
phaX = atan(imag(X)./real(X)); // hoặc phaX = arg(X)

subplot(211)
plot(omega, magX);
title("Biên độ |X(e^{j\omega})|");
xlabel("\omega"); ylabel("|X|");

subplot(212)
plot(omega, phaX);
title("Pha \angle X(e^{j\omega})");
xlabel("\omega"); ylabel("pha");
