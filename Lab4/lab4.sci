//Ex5
atomsSystemUpdate();
atomsInstall("IPCV");
atomsLoad("IPCV");
img = imread("D:\XLTHS\Lab_Official\DSP_LAB4-5\Lab4\test.jpg");
subplot(4,2,1);
title("Original Image");
imshow(img);
gray_img = rgb2gray(img);
subplot(4,2,2);
title("Original Gray Image");
imshow(gray_img);
[count, cells] = imhist(gray_img);
subplot(4,2,3);
title("Histogram of Original Image");
plot2d3('gnn', cells, count);

equalized_img = imhistequal(gray_img);

subplot(4,2,4);
imshow(equalized_img);
title("Equalized Image");
subplot(4,2,5);
[count, cells] = imhist(equalized_img);
plot2d3('gnn', cells, count);
title("Histogram after Equalization");


h = fspecial('gaussian', [5, 5], 1);
blurred_img = imfilter(img, h);

subplot(4,2,6);
imshow(blurred_img);
title("Blurred Image");

watermark_img = img;
subplot(4,2,7);
imshow(watermark_img);
title("Image with Watermark");
xstring(10, size(watermark_img,1)-10, "HCMUT-K22", 100);
//Ex6
///b)
function [yn, yo, Ex, Ey] = convolution(xn, xo, hn, ho)
    N = length(xn) + length(hn) - 1;
    yn = zeros(1, N);
    
    for n = 1:N
        for k = 1:length(xn)
            idx = n - k + 1;
            if (idx >= 1) && (idx <= length(hn))
                yn(n) = yn(n) + xn(k) * hn(idx);
            end
        end
    end
    
    // Xác định yorigin
    yo = xo + ho - 1; 
    
    // Tính năng lượng của x(n) và y(n)
    Ex = sum(xn .^ 2);
    Ey = sum(yn .^ 2);
    
    // Trục hoành
    nx = (0:length(xn)-1) - xo;
    nh = (0:length(hn)-1) - ho;
    ny = (0:length(yn)-1) - yo;
    
    // Vẽ đồ thị
    scf(1);
    subplot(4,1,1);
    plot2d3(nx, xn, style=2);
    title('x(n)');
    
    subplot(4,1,2);
    plot2d3(nh, hn, style=2);
    title('h(n)');
    
    subplot(4,1,3);
    plot2d3(ny, yn, style=5);
    title('y(n) = x(n) * h(n) : folding and shifting');
    
    subplot(4,1,4);
    bar([1,2], [Ex, Ey], 'g');
    title('Energy of x(n) and y(n)');
endfunction

// Dữ liệu đầu vào
x = [1, 2, -3, 2, 1];
h = [1, 0, -1];
xo = 1;
ho = 1;
[yn, yo, Ex, Ey] = convolution(x, xo, h, ho);

///c)
function [y, Ex, Ey] = convolution_matrix_method(x, h)
    N = length(x);
    len_y = length(x) + length(h) - 1;
    
    //Taoj matrix so hang la lenh va cot la ylen y
    H = zeros(length(h), len_y);
    
    //Nhan tung hang voi x(n)
    for i = 1:length(h)
        H(i, i:i+length(x)-1) = x * h(i);
    end
    
    //conng tung cot
    y = sum(H, 'r');
    
    Ex = sum(x .^ 2);
    Ey = sum(y .^ 2);
    
    scf(2);
    subplot(4,1,1);
    title('xc(n)');
    plot2d3(0:length(x)-1, x, style=5);

    subplot(4,1,2);
    title('hc(n)');
    plot2d3(0:length(h)-1, h, style=5);

    subplot(4,1,3);
    title('yc(n)');
    plot2d3(0:len_y-1, y, style=5);
    
    subplot(4,1,4);
    bar([1,2], [Ex, Ey], 'g');
    title('Energy of x(n) and y(n)');
endfunction
xc = [1, 2, -3, 2, 1];
hc = [1, 0, -1];
xoc = 1;
hoc = 1;
[ync, Ecx, Ecy] = convolution_matrix_method(xc, hc);

//7a)
function [y, yo, Ex, Ey] = circular_convolution(x, xo, h, ho)
    N = length(x);
    M = length(h);
    

    y = zeros(1, N);
    for i = 1:N
        for k = 1:M
            idx = modulo(i - k, N);
            if idx < 0 then
                idx = idx + N;
            end
            idx = idx + 1;
            y(i) = y(i) + x(idx) * h(k);
        end
    end
    
    Ex = sum(x.^2);
    Ey = sum(y.^2);

    yo = xo + ho - 1;
    disp(x);
    disp(y);
    disp(Ex);
    disp(Ey);
    scf(3);
    subplot(4,1,1);
    title('x7a');
    plot2d3(0:length(x)-1, x, style = 3);
    
    subplot(4,1,2);
    title('h7a');
    plot2d3(0:length(h)-1, h, style = 3);
    
    subplot(4,1,3);
    title('y7a');
    plot2d3(0:length(y)-1, y, style = 3);
    
    subplot(4,1,4);
    bar([1,2], [Ex, Ey], 'g');
    title('Energy of x(n) and y(n)');
end

x7a = [1, 2, -3, 2, 1];
h7a = [1, 0, -1, -1, 1];
x7aorigin = 1;
h7aorigin = 1;
[y7a, yo7a, Ex7a, Ey7a] = circular_convolution(x7a, x7aorigin, h7a, h7aorigin);

//7b
function [y, yo, Ex, Ey] = matrix_circular_convolution(x, xo, h, ho)
    N = length(x);
    M = length(h); 
 
    H = zeros(M, M);
    for i = 1:M
        H(i, :) = circshift(h, i-1);
    end
    
    y = H' * x';
    
    Ex = sum(x.^2);
    Ey = sum(y.^2);

    yo = xo + ho - 1;

    disp("x:"); disp(x);
    disp("h:");disp(H');
    disp("y:"); disp(y);
    disp("Ex:"); disp(Ex);
    disp("Ey:"); disp(Ey);


    scf(4);
    
    subplot(4, 1, 1);
    title('x7b');
    plot2d3(0:N-1, x, style = 2);
    
    subplot(4, 1, 2);
    title('h7b');
    plot2d3(0:M-1, h, style = 2);
    
    subplot(4, 1, 3);
    title('y7b');
    plot2d3(0:length(y)-1, y, style = 2);
    
    subplot(4, 1, 4);
    bar([1, 2], [Ex, Ey], 'g');
    title('Energy of x(n) and y(n)');
end


x7b = [1, 2, -3, 2, 1];
h7b = [1, 0, -1, -1, 1];
x7b_origin = 1;
h7b_origin = 1;
[y7b, yo7b, Ex7b, Ey7b] = matrix_circular_convolution(x7b, x7b_origin, h7b, h7b_origin);


