function y = circonv_direct(x, h)
    N = length(x);
    x = matrix(x, 1, N);  // đảm bảo là vector hàng
    h = matrix(h, 1, N);

    y = zeros(1, N);
    for n = 1:N          // Scilab bắt đầu từ 1
        acc = 0;
        for k = 1:N
            idx = modulo(n - k, N);       // idx ∈ {0, ..., N-1}
            idx_sc = idx + 1;             // chuyển về chỉ số từ 1 → N
            acc = acc + x(k) * h(idx_sc);
        end
        y(n) = acc;
    end
endfunction
