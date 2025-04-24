// Nạp hai hàm
funcprot(0);
exec('circonv_fft.sci', -1);
exec('circonv_direct.sci', -1);

// Ví dụ 1: dãy tự chọn
x = [1 2 3 4];
h = [4 3 2 1];

y_fft  = circonv_fft(x, h);
y_dir  = circonv_direct(x, h);

disp("Kết quả bằng FFT :"), disp(y_fft);
disp("Kết quả trực tiếp:"), disp(y_dir);
disp("||y_fft - y_dir||_2 = " + norm(y_fft - y_dir, 2));

// Ví dụ 2: kiểm thử ngẫu nhiên nhiều lần
printf("\nKiểm thử 5 bộ tín hiệu ngẫu nhiên:\n");
for t = 1:5
    N  = 8 + grand(1, "uin", 0, 8);   // độ dài 8-16
    x  = grand(1,N, "uin", -5, 5);    // số nguyên ngẫu nhiên
    h  = grand(1,N, "uin", -5, 5);
    y1 = circonv_fft(x, h);
    y2 = circonv_direct(x, h);
    err = norm(y1 - y2, 2);
    printf("Test %d (N=%d)  lỗi = %e\n", t, N, err);
end
