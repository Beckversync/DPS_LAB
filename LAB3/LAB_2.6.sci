// =============================
// Vẽ x1(n) và y1(n) = x1^2(n)
// =============================
clf; // Xóa tất cả các hình cũ
n = -1:1:10;            // Chọn khoảng n để vẽ
x1 = zeros(1, length(n));

// Định nghĩa x1(n) = 1 cho 0 <= n <= 3, ngược lại 0
for i=1:length(n)
    if (n(i) >= 0 & n(i) <= 3) then
        x1(i) = 1;
    end
end

// Tính y1(n) = x1(n)^2
y1 = x1.^2;

// Vẽ dạng stem để minh họa tín hiệu rời rạc
subplot(2,1,1);
plot2d3 (n, x1);
xtitle("Tín hiệu x1(n)");

subplot(2,1,2);
stem(n, y1);
xtitle("Tín hiệu y1(n) = x1(n)^2");
