// ------------------------------------------------------------
//  linconv_fft.sci
//  Linear convolution via FFT with automatic zero-padding
// ------------------------------------------------------------
function y = linconv_fft(x, h)
    // Bảo đảm x, h là hàng vector
    x = matrix(x, 1, -1);
    h = matrix(h, 1, -1);

    Nx = length(x);
    Nh = length(h);
    N  = Nx + Nh - 1;          // độ dài kết quả tuyến tính

    // Zero-padding tới đúng N (FFT Scilab chấp nhận N bất kỳ)
    X = fft([x, zeros(1, N - Nx)], -1);
    H = fft([h, zeros(1, N - Nh)], -1);

    y = real( fft( X .* H, 1 ) );   // IFFT rồi lấy phần thực
endfunction
