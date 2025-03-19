// Định nghĩa tín hiệu gốc x(n)
x = [1, -2, 3, 6];
n = [-2, -1, 0, 1]; // Trục thời gian của x(n)

// Xác định các tín hiệu biến đổi
y1 = [0, 6, 3, -2, 1]; 
n1 = [-2, -1, 0, 1, 2]; // Trục thời gian của y1(n)

y2 = [0, 1, -2, 3, 6]; 
n2 = [-6, -5, -4, -3, -2]; // Trục thời gian của y2(n)


y3 = [0, 12, 6, -4, 2]; 
n3 = [-4, -3, -2, -1, 0]; // Trục thời gian của y3(n)

// Vẽ đồ thị
clf;
subplot(3,2,1);
plot2d3(n, x);
title('Original Signal x(n)');
xlabel('n');
ylabel('x(n)');


subplot(3,2,2);
plot2d3(n1, y1);
title('y_1(n) = x(-n)');
xlabel('n');
ylabel('y_1(n)');


subplot(3,2,3);
plot2d3(n, x);
title('Original Signal x(n)');
xlabel('n');
ylabel('x(n)');


subplot(3,2,4);
plot2d3(n2, y2);
title('y_2(n) = x(n+3)');
xlabel('n');
ylabel('y_2(n)');


subplot(3,2,5);
plot2d3(n, x);
title('Original Signal x(n)');
xlabel('n');
ylabel('x(n)');


subplot(3,2,6);
plot2d3(n3, y3);
title('y_3(n) = 2x(-n-2)');
xlabel('n');
ylabel('y_3(n)');

