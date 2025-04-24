// ============================================================
//  CIRCULAR CONVOLUTION DEMO  – 1 file duy nhất để chạy
// ============================================================

clear; clc;
funcprot(0);        // cho phép redefine hàm

//-------------------------------------------------------------
//  Hàm dư dương: pmod(x,N)  → 0 … N-1   
//-------------------------------------------------------------
function r = pmod(x, N)
    r = modulo(x, N);
    if or(r < 0) then
        r(r < 0) = r(r < 0) + N;
    end
endfunction

//-------------------------------------------------------------
//  Hàm 1 : Circular convolution dùng FFT
//-------------------------------------------------------------
function y = circonv_fft(x, h)
    N = length(x);
    x = matrix(x, 1, N);      // ép về vector hàng
    h = matrix(h, 1, N);

    Y = fft(x, -1) .* fft(h, -1);   // FFT thuận rồi nhân
    y = real(fft(Y, 1));            // IFFT
endfunction

//-------------------------------------------------------------
//  Hàm 2 : Circular convolution tính trực tiếp
//-------------------------------------------------------------
function y = circonv_direct(x, h)
    N = length(x);
    x = matrix(x, 1, N);
    h = matrix(h, 1, N);
    y = zeros(1, N);

    for n = 1:N
        acc = 0;
        for k = 1:N
            idx = pmod(n - k, N) + 1;   // 1 … N  (không còn 0)
            acc = acc + x(k) * h(idx);
        end
        y(n) = acc;
    end
endfunction

//-------------------------------------------------------------
//  Kiểm thử – ví dụ 
//-------------------------------------------------------------
disp("== Ví dụ  ==");
x = [1 2 3 4];
h = [4 3 2 1];
y_fft = circonv_fft(x, h);
y_dir = circonv_direct(x, h);

disp("FFT    : "), disp(y_fft);
disp("Direct : "), disp(y_dir);

mprintf("Sai số 2-norm = %e\n\n", norm(y_fft - y_dir, 2));

//-------------------------------------------------------------
//  Kiểm thử – 5 bộ tín hiệu ngẫu nhiên
//-------------------------------------------------------------
disp("== 5 bộ tín hiệu ngẫu nhiên ==");
for t = 1:5
    N  = grand(1, "uin", 4, 13);        // độ dài ngẫu nhiên 4 … 12
    x  = grand(1, N, "uin", -5, 6);     // số nguyên ∈ [-5,5]
    h  = grand(1, N, "uin", -5, 6);

    err = norm(circonv_fft(x, h) - circonv_direct(x, h), 2);
    mprintf("Test %-2d (N=%2d)  Sai số = %e\n", t, N, err);
end
