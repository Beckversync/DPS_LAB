// --- Khởi tạo ---
clc;
clear;

// Tạo trục n, ví dụ từ -5 đến 10
n = -5:10;

// Định nghĩa hàm x(n) theo đề bài:
function val = xOfn(k)
    if (k >= -2 & k <= 2) then
        val = 1;
    elseif (k >= 3 & k <= 4) then
        val = 1/2;
    else
        val = 0;
    end
endfunction

// Tạo vector x ứng với từng giá trị n
x = zeros(1, length(n));
for i = 1:length(n)
    x(i) = xOfn(n(i));
end

// Kiểm tra tín hiệu gốc x(n)
clf; // xóa các hình vẽ cũ
subplot(3,3,1);
plot2d3 (n, x);
xtitle("Tín hiệu gốc x(n)");

// (a) y_a(n) = x(n - 2)
y_a = zeros(1, length(n));
for i = 1:length(n)
    // n(i) là chỉ số thật, ta muốn tính x(n(i) - 2)
    k = n(i) - 2;
    y_a(i) = xOfn(k);
end

// Vẽ
subplot(3,3,2);
plot2d3 (n, y_a);
xtitle("a) y_a(n) = x(n - 2)");
// (b) y_b(n) = x(4 - n)
y_b = zeros(1, length(n));
for i = 1:length(n)
    k = 4 - n(i);
    y_b(i) = xOfn(k);
end

// Vẽ
subplot(3,3,3);
plot2d3 (n, y_b);
xtitle("b) y_b(n) = x(4 - n)");

// (c) y_c(n) = x(n + 2)
y_c = zeros(1, length(n));
for i = 1:length(n)
    k = n(i) + 2;
    y_c(i) = xOfn(k);
end

// Vẽ
subplot(3,3,4);
plot2d3 (n, y_c);
xtitle("c) y_c(n) = x(n + 2)");

// (d) y_d(n) = x(n)*u(2 - n)
y_d = zeros(1, length(n));
for i = 1:length(n)
    if (n(i) <= 2) then
        y_d(i) = x(i); // x(i) hay xOfn(n(i)) đều được, ở đây x(i) là phần tử thứ i
    else
        y_d(i) = 0;
    end
end

// Vẽ
subplot(3,3,5);
plot2d3 (n, y_d);
xtitle("d) y_d(n) = x(n)*u(2-n)");

// (e) y_e(n) = x(n-1)*delta(n-3)
y_e = zeros(1, length(n));
for i = 1:length(n)
    if (n(i) == 3) then
        // n(i)-1 = 2 -> x(2) = 1
        y_e(i) = xOfn(n(i)-1);
    else
        y_e(i) = 0;
    end
end

// Vẽ
subplot(3,3,6);
plot2d3 (n, y_e);
xtitle("e) y_e(n) = x(n-1)*delta(n-3)");

// (f) y_f(n) = x(n^2)
y_f = zeros(1, length(n));
for i = 1:length(n)
    k = n(i)^2;
    y_f(i) = xOfn(k);
end

// Vẽ
subplot(3,3,7);
plot2d3(n, y_f);
xtitle("f) y_f(n) = x(n^2)");
// (g) x_even(n) = [x(n) + x(-n)] / 2
x_even = zeros(1, length(n));
for i = 1:length(n)
    x_even(i) = 0.5 * ( x(i) + xOfn(-n(i)) );
end

// Vẽ
subplot(3,3,8);
plot2d3 (n, x_even);
xtitle("g) Phần chẵn của x(n)");
// (h) x_odd(n) = [x(n) - x(-n)] / 2
x_odd = zeros(1, length(n));
for i = 1:length(n)
    x_odd(i) = 0.5 * ( x(i) - xOfn(-n(i)) );
end

// Vẽ
subplot(3,3,9);
plot2d3(n, x_odd);
xtitle("h) Phần lẻ của x(n)");

