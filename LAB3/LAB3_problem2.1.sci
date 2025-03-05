
clc;
clear;
clf;

n = -5:5; // Chọn một khoảng rộng hơn để hiển thị tốt hơn
x = zeros(1, length(n)); // Khởi tạo x(n) với giá trị mặc định là 0

// Tính giá trị x(n) theo công thức
for i = 1:length(n)
    if n(i) >= -3 & n(i) <= -1 then
        x(i) = 1 + n(i)/3;
    elseif n(i) >= 0 & n(i) <= 3 then
        x(i) = 1;
    else
        x(i) = 0;
    end
end

// Vẽ tín hiệu
stem(n, x, 'filled');
xlabel("n");
ylabel("x(n)");
title("Discrete-time signal x(n)");
xtitle("Đồ thị của tín hiệu x(n)");
grid();

//.......................

x_flip = x($:-1:1); // Lật ngược x
n_flip = -n($:-1:1); // Lật ngược và đổi dấu n


n_shift = n_flip + 4; // Dịch phải 4 đơn vị

// Vẽ đồ thị
clf;
plot2d3 (n_shift, x_flip);
xlabel("n");
ylabel("x(-n+4)");
title("Tín hiệu x(-n+4)");

//...............
// Dịch phải 4 đơn vị trước
n_shift = n + 4;

// Lật tín hiệu sau khi dịch
x_flip = x($:-1:1);      // Lật ngược x
n_flip = n_shift($:-1:1); // Lật ngược trục n đã dịch

// Vẽ đồ thị
clf;
plot2d3 (n_shift, x_flip);
xlabel("n");
ylabel("x(-n-4)");
title("Tín hiệu x(-n-4)");
grid();
