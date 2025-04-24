clc;
clear;

// Bước 1: Tạo dãy omega
omega = 0:%pi/500:2*%pi;

// Bước 2: Xây dựng H(e^jω) = 1 + e^{-jω}
H = 1 + exp(-%i*omega);

// Bước 3: Xây dựng X(e^jω) = 1 / (1 - 0.5 * e^{-jω})
X = 1 ./ (1 - 0.5*exp(-%i*omega));

// Bước 4: Tính Y(e^jω)
Y = H .* X;

// Bước 5: Biên độ và Pha
MagY = abs(Y);
PhaseY = atan(imag(Y) ./ real(Y));

// Vẽ phổ biên độ
scf(1);
plot(omega, MagY);
xtitle('Phổ biên độ |Y(e^{jω})|', 'ω (rad/sample)', '|Y(e^{jω})|');

// Vẽ phổ pha
scf(2);
plot(omega, PhaseY);
xtitle('Phổ pha ∠Y(e^{jω})', 'ω (rad/sample)', 'Pha (rad)');
