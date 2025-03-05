//EX1
function [yn, yorigin] = delay(xn, xorigin, k)
    yorigin = xorigin - k;
    yn = xn;
    nx = (-xorigin + 1) : (length(xn) - xorigin);
    ny = (-yorigin + 1) : (length(yn) - yorigin);
    //figure
    scf(1);
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=2);
    title("xn1");
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=5);
    title("yn1");
endfunction
xn1 = [1, -2, 3, 6, 9, 7];
xo1 = 4;
[yn1, yo1] = delay(xn1, xo1,2)
 
 
//EX2
function [yn, yorigin] = advance (xn, xorigin, k)
    yorigin = xorigin + k;
    yn = xn;
    nx = (-xorigin + 1) : (length(xn) - xorigin);
    ny = (-yorigin + 1) : (length(yn) - yorigin);
    //figure
    scf(2);
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=2);
    title("xn2");
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=5);
    title("yn2");
endfunction
xn2 = [1, -2, 3, 6, 9, 7];
xo2 = 4;
[yn2, yo2] = advance(xn2, xo2,2)

//EX3
function [yn, yorigin] = fold(xn, xorigin)
    yorigin = length(xn)- xorigin + 1;
    yn = xn($:-1:1);
    nx = (-xorigin + 1) : (length(xn) - xorigin);
    ny = (-yorigin + 1) : (length(yn) - yorigin);
    //figure
    scf(3);
    subplot(2,1,1);
    plot2d3(nx,xn,style=2);
    title("xn3");
    subplot(2,1,2);
    plot2d3(ny,yn,style=5);
    title("yn3");
    endfunction
xn3 = [1, -2, 3, 6, 9, 7];
xo3 = 4;
[yn3, yo3]=fold(xn3, xo3);

//EX4
function [yn, yorigin] = add (x1n, x1origin, x2n, x2origin)
    // Chênh lệch 2 gốc
    shift = abs(x1origin - x2origin);
    if x1origin > x2origin then
        x2n = [zeros(1, shift), x2n];  // Dịch x2n sang phải
        x2origin = x1origin;
    else
        x1n = [zeros(1, shift), x1n]; // Dịch x1n sang phải
        x1origin = x2origin;
    end
    
    // Đảm bảo cả hai tín hiệu có cùng độ dài
    max_len = max(length(x1n), length(x2n));
    x1n = resize_matrix(x1n, 1, max_len);
    x2n = resize_matrix(x2n, 1, max_len);
    
    // Cộng hai tín hiệu
    yn = x1n + x2n;
    yorigin = x1origin;
    
    // n là các giá trị của trục hoành
    n = (-x1origin + 1):(max_len - x1origin);
    
    //figure
    scf(4);
    subplot(3,1,1);
    plot2d3(n, x1n, style=7);
    title('x1(n)');

    subplot(3,1,2);
    plot2d3(n, x2n, style=7);
    title('x2(n)');

    subplot(3,1,3);
    plot2d3(n, yn, style=5);
    title('y(n) = x1(n) + x2(n)');
endfunction
x1n = [1, -2, 3, 6, 9, 7];
x2n = [1, 1, 2, 3, -5, -3];
[yn4, yo4]= add(x1n, 4, x2n, 2);

//EX5
function [yn, yorigin] = multi (x1n, x1origin, x2n, x2origin)
   //Chênh lệch giữa hai gốc tọa độ
    shift = abs(x1origin - x2origin);

    //Xét 2 gốc tọa độ
    if x1origin > x2origin then
        x2n = [zeros(1, shift), x2n];  // Dịch x2n sang phải
        x2origin = x1origin;
    else
        x1n = [zeros(1, shift), x1n];  // Dịch x1n sang phải
        x1origin = x2origin;
    end

    // Đảm bảo cả hai tín hiệu có cùng độ dài bằng cách thêm số 0 vào cuối
    max_len = max(length(x1n), length(x2n));
    x1n = resize_matrix(x1n, 1, max_len);
    x2n = resize_matrix(x2n, 1, max_len);

    // Thực hiện phép nhân từng phần tử
    yn = x1n .* x2n;
    yorigin = x1origin;

    // n là các giá trị của trục hoành
    n = (-x1origin + 1):(max_len - x1origin);

    //figure
    scf(5);
    subplot(3,1,1);
    plot2d3(n, x1n, style=7);
    title('x1(n)');

    subplot(3,1,2);
    plot2d3(n, x2n, style=7);
    title('x2(n)');

    subplot(3,1,3);
    plot2d3(n, yn, style=5);
    title('y(n) = x1(n) .* x2(n)');
    endfunction
x1n = [1, -2, 3, 6, 9, 7];
x2n = [1, 1, 2, 3, -5, -3];
[yn5, yo5]= multi(x1n, 4, x2n, 2);

//EX6
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
yn = conv(xn, hn);
yo = xorigin + horigin - 1;

// Xác định ccas phần tử trục hoành
nx = (-xorigin + 1):(length(xn) - xorigin);
nh = (-horigin + 1):(length(hn) - horigin);
ny = (-yo + 1):(length(yn) - yo);

// figure
scf(6);
subplot(3,1,1);
plot2d3(nx, xn, style=2);
title('x(n)');

subplot(3,1,2);
plot2d3(nh, hn, style=2);
title('h(n)');

subplot(3,1,3);
plot2d3(ny, yn, style=5);
title('Convolution: y(n) = x(n) * h(n)');
endfunction
xn = [1, -2, 3, 2];
hn = [1, 1, 2, 3];
[yn, yorigin] = convolution(xn, 4, hn, 2);
