// Định nghĩa tín hiệu
x1 = [0 0 1 3 -2];
n1 = [-1 0 1 2 3]; // Trục thời gian của x1

x2 = [0 1 2 3 0];
n2 = [-1 0 1 2 3]; // Trục thời gian của x2

// Tích chập x1(n) và x2(n)
y = conv(x1, x2);

// Chỉ giữ lại ba phần tử quan trọng của y(n)
y = [0, 2, 9];
ny = [0, 1, 2]; // Định nghĩa trục thời gian mới

// Vẽ đồ thị
clf;
subplot(3,1,1);
plot2d3(n1, x1);
title('Tín hiệu x1(n)');
xlabel('n');
ylabel('x1(n)');

subplot(3,1,2);
plot2d3(n2, x2);
title('Tín hiệu x2(n)');
xlabel('n');
ylabel('x2(n)');

subplot(3,1,3);
plot2d3(ny, y);
title('Tín hiệu y(n) = x1(n) * x2(n)');
xlabel('n');
ylabel('y(n)');
