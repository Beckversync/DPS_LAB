// Xác định khoảng giá trị của n
n = [-1 0 1 2 3];  

// Định nghĩa các tín hiệu rời rạc
x1 = [0 0 1 3 -2];  
x2 = [0 1 2 3 0];  
y = x1 + x2;  // Tín hiệu tổng

// Tạo cửa sổ đồ thị
scf();  

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

// Hiển thị cửa sổ đồ thị
show_window();  
