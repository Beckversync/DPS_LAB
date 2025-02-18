////Ex2
scf(1);
subplot(3,1,1);
n = -5:5;
msignal = bool2s (n >= 0);
plot2d3(n, msignal);
xlabel("n");
ylabel("msignal");
title("Ex2");

////Ex3
subplot(3,1,2);
n = -5:5;
msignal = bool2s (n == 0);
plot2d3(n, msignal); 
xlabel("n");
ylabel("msignal");
title("Ex3");

////Ex4
subplot(3,1,3);
n = -5:5;
ur = bool2s(n >= 0) .* n;
plot2d3(n, ur)
xlabel("n")
ylabel("u_r(n)")
title("Unit Ramp Signal")

////Ex5
scf(2);
n = [-1 0 1];
x = [1 3 -2];
x_neg = [x(3) x(2) x(1)];  // Đảo ngược tín hiệu

xe = (x + x_neg) / 2;
xo = (x - x_neg) / 2;

subplot(3,1,1)
plot2d3(n, x)
title("Original Signal x(n)")
xlabel("n")
ylabel("x(n)")

subplot(3,1,2)
plot2d3(n, xe)
title("Even Component xe(n)")
xlabel("n")
ylabel("xe(n)")

subplot(3,1,3)
plot2d3(n, xo)
title("Odd Component xo(n)")
xlabel("n")
ylabel("xo(n)")

////Ex6
scf(3);
// Xác định khoảng giá trị của n
n = [-1 0 1 2 3];  

// Định nghĩa các tín hiệu rời rạc
x1 = [0 0 1 3 -2];  
x2 = [0 1 2 3 0];  
y = x1 + x2;  // Tín hiệu tổng

// Vẽ tín hiệu x1(n)
subplot(3,1,1);  
plot2d3(n, x1);  
title("Signal x1(n)");  
xlabel("n");  
ylabel("x1(n)");  

// Vẽ tín hiệu x2(n)
subplot(3,1,2);  
plot2d3(n, x2);  
title("Signal x2(n)");  
xlabel("n");  
ylabel("x2(n)");  

// Vẽ tín hiệu tổng y(n) = x1(n) + x2(n)
subplot(3,1,3);  
plot2d3(n, y);  
title("Sum of Signals y(n) = x1(n) + x2(n)");  
xlabel("n");  
ylabel("y(n)");

////Ex7
scf(4);
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

////Ex8
scf(5);
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


