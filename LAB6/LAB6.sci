// Ex3a: x1(n) = 0.1^n * u(n)
n = 0:100;
x = 0.1 .^ n;  //ham x1(n))

//DFT
X = fft(x);

omega = 2 * %pi * (0:length(X)-1) / length(X);

//Bien do va pha pho
amp_spectrum = abs(X);                    //Bien do
phase_spectrum = atan(imag(X), real(X)); //Pha pho

//bien do pho
scf(1);                    
subplot(2, 1, 1);
plot(omega, amp_spectrum);
xlabel('Tần số (\omega)');
ylabel('Biên độ');
title('Biên độ phổ (Amplitude Spectrum)');

//pha pho
subplot(2, 1, 2);
plot(omega, phase_spectrum);
xlabel('Tần số (\omega)');
ylabel('Pha (radians)');
title('Pha phổ (Phase Spectrum)');


// Ex3b: x(n) = δ(n) + δ(n-1) + δ(n-2) + δ(n-3) = [1, 1, 1, 1]
x2 = [1, 1, 1, 1];

N = length(x2);
omega = linspace(-%pi, %pi, 2000);
X = zeros(1, length(omega));

for k = 1:length(omega)
    X(k) = sum(x2 .* exp(-%i * omega(k) * [0:N-1]));
end

//amplitude spectrum and phase spectrum
amp_spectrum = abs(X);
phase_spectrum = atan(imag(X), real(X));


scf(2);
//biendo
subplot(2, 1, 1);
plot(omega, amp_spectrum);
xlabel('Tần số (\omega)');
ylabel('Biên độ');
title('Biên độ phổ (Amplitude Spectrum)');

//pha pho
subplot(2, 1, 2);
plot(omega, phase_spectrum);
xlabel('Tần số (\omega)');
ylabel('Pha (radians)');
title('Pha phổ (Phase Spectrum)');

//4.2
f = -10:0.01:10;  
a = 4;            
A = 2;            

//a
Xa_a = A ./ (a + %i*2*%pi*f);
mag_a = abs(Xa_a);
phase_a = atan(imag(Xa_a), real(Xa_a));
//b
Xa_b = 2*a*A ./ (a^2 + (2*%pi*f).^2);
mag_b = abs(Xa_b);
phase_b = zeros(f);

scf(3);
subplot(2,2,1)
plot(f, mag_a)
title("a. |Xa(F)| for xa(t) = A*exp(-a*t)")
xlabel("Frequency (Hz)")
ylabel("Magnitude")

subplot(2,2,2)
plot(f, phase_a)
title("a. Phase ∠Xa(F) for xa(t) = A*exp(-a*t)")
xlabel("Frequency (Hz)")
ylabel("Phase (rad)")

subplot(2,2,3)
plot(f, mag_b)
title("b. |Xa(F)| for xa(t) = A*exp(-a*|t|)")
xlabel("Frequency (Hz)")
ylabel("Magnitude")

subplot(2,2,4)
plot(f, phase_b)
title("b. Phase ∠Xa(F) for xa(t) = A*exp(-a*|t|)")
xlabel("Frequency (Hz)")
ylabel("Phase (rad)")

//4.3
tau = 0.75;  // τ
F = linspace(-5, 5, 1000);
X_F = tau * (sin(%pi * F * tau) ./ (%pi * F * tau)).^2;
X_F_phase = zeros(size(F));


scf(4);
subplot(2, 1, 1);
plot(F, X_F);
xlabel("F (Frequency)");
ylabel("|X_a(F)|");
title("Magnitude Spectrum |X_a(F)|");

//4.4
N = 6;
x = [3, 2, 1, 0, 1, 2];  // x(0) to x(5)
n = 0:N-1;

// Compute DFT using Fourier coefficients
X = fft(x, -1);

magX = abs(X);
phaseX = atan(imag(X), real(X));

scf(5);
subplot(3, 1, 1);
plot(n, x);
xlabel("n");
ylabel("x(n)");
title("Time-Domain Signal x(n)");

subplot(3, 1, 2);
plot(n, magX);
xlabel("k");
ylabel("|c_k|");
title("Magnitude Spectrum |c_k|");

subplot(3, 1, 3);
plot(n, phaseX);
xlabel("k");
ylabel("∠c_k (radians)");
title("Phase Spectrum angle c_k");
