clc;
clear;

// Tần số xuất hiện trong tín hiệu
omega = [0, %pi/4, %pi/2, 3*%pi/4];

// Công suất tương ứng
PDS = [4, 2, 0.5, 0.125];

// Vẽ bar chart
bar(omega, PDS);
xtitle('Power Density Spectrum of x(n)', 'Omega (rad/sample)', 'PDS');
