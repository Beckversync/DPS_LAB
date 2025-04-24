//------------------------------------------------------------
//  test_linconv_fft.sce   (sửa lỗi cộng chuỗi + số)
//------------------------------------------------------------
funcprot(0);
exec('linconv_fft.sci', -1);

// ----- Ví dụ tay -----
x = [1 2 3];
h = [3 1 2 1];

y_fft  = linconv_fft(x, h);
y_conv = conv(x, h);

disp("Ví dụ tay:");
disp("linconv_fft :"), disp(y_fft);
disp("conv        :"), disp(y_conv);
mprintf("Sai số 2-norm = %e\n\n", norm(y_fft - y_conv, 2));

// ----- 5 bộ dữ liệu ngẫu nhiên -----
disp("5 bộ tín hiệu ngẫu nhiên:");
for t = 1:5
    Nx = grand(1, "uin", 3, 10);           // 3…9
    Nh = grand(1, "uin", 3, 10);
    x  = grand(1, Nx, "uin", -5, 6);
    h  = grand(1, Nh, "uin", -5, 6);

    err = norm( linconv_fft(x, h) - conv(x, h), 2 );
    mprintf("Test %d  (Nx=%d, Nh=%d)  Sai số = %e\n", t, Nx, Nh, err);
end
