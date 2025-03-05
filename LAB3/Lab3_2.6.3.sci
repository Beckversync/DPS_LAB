// =============================
// Vẽ y1(n) = n * x1(n)
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

// Tính y1(n) = n * x1(n)
y1 = zeros(1, length(n));
for i=1:length(n)
    y1(i) = n(i) * x1(i);
end

subplot(2,1,1);
plot2d3(n, x1);
xtitle("Tín hiệu x1(n)");

subplot(2,1,2);
plot2d3(n, y1);
xtitle("Tín hiệu y1(n) = n * x1(n)");
