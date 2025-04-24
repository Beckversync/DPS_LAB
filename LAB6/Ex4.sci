clc;
clear;
omega = 0:%pi/500:2*%pi; // tần số từ 0 đến 2pi

// Hàm truyền đạt H(e^{jω})
ReD = 1 + 0.1*cos(omega) + 0.2*cos(2*omega);
ImD = - (0.1*sin(omega) + 0.2*sin(2*omega));

MagH = 1 ./ sqrt(ReD.^2 + ImD.^2);
PhaseH = -atan(ImD ./ ReD);

// Vẽ phổ biên độ
scf(1);
plot(omega, MagH);
xtitle('Phổ biên độ |H(e^{jω})|', 'ω (rad/sample)', '|H(e^{jω})|');

// Vẽ phổ pha
scf(2);
plot(omega, PhaseH);
xtitle('Phổ pha ∠H(e^{jω})', 'ω (rad/sample)', 'Pha (rad)');
