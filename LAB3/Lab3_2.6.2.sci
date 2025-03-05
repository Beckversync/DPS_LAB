// =============================
// Vẽ y1(n) = x1(n) - x1(n-1)
// =============================
clf;
n = -1:1:8;
x1 = zeros(1, length(n));

// Định nghĩa x1(n)
for i=1:length(n)
    if (n(i) >= 0 & n(i) <= 3) then
        x1(i) = 1;
    end
end

// Tính y1(n)
y1 = zeros(1, length(n));
for i=1:length(n)
    // x1(n(i)) - x1(n(i)-1)
    nn = n(i);
    // Tìm chỉ số trong mảng tương ứng với nn-1
    idx_n  = find(n == nn);
    idx_n1 = find(n == nn-1);
    if (size(idx_n1,"*") <> 0) then
        y1(i) = x1(idx_n) - x1(idx_n1);
    else
        // nếu nn-1 nằm ngoài mảng n
        y1(i) = x1(idx_n) - 0;
    end
end

subplot(2,1,1);
plot2d3 (n, x1);
xtitle("Tín hiệu x1(n)");

subplot(2,1,2);
plot2d3 (n, y1);
xtitle("Tín hiệu y1(n) = x1(n) - x1(n-1)");
