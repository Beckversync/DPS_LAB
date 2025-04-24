function y = circonv_fft(x, h)
    // Circular convolution sử dụng FFT/IFFT
    // --- Giả định: x và h có cùng độ dài N
    N = length(x);
    // Bảo đảm cả hai là cột hoặc hàng vector nhất quán
    x = matrix(x, 1, N);
    h = matrix(h, 1, N);
    
    X = fft(x, -1);          // FFT thuận  (-1 là chế độ thuận trong Scilab)
    H = fft(h, -1);
    Y = X .* H;              // Nhân điểm-theo-điểm trong miền tần số
    y = real(fft(Y, 1));     // IFFT (1 là chế độ nghịch)  → kết quả miền thời gian
endfunction
