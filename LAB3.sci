close();
//EX1
function [yn, yorigin] = delay(xn, xorigin, k)
    yorigin = xorigin - k;
    
    yn = xn;
    
   
    nx = linspace(-xorigin + 1, length(xn) - xorigin, length(xn));
    ny = linspace(-yorigin + 1, length(yn) - yorigin, length(yn));
    //figure
    scf(1);
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=2);
    title("xn1");
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=5);
    title("yn1");
endfunction
 xn1 = [1,-2,3,6];
 xo1 = 3;
 [yn1, yo1] = delay(xn1, xo1,1)
 
 
//EX2
function [yn, yorigin] = advance (xn, xorigin, k)
    yorigin = xorigin + k;
    
    yn = xn;
    
    nx = linspace(-xorigin + 1, length(xn) - xorigin, length(xn));
    ny = linspace(-yorigin + 1, length(yn) - yorigin, length(yn));
    //figure
    scf(2);
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=2);
    title("xn2");
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=5);
    title("yn2");
endfunction
xn2 = [1,-2,3,6];
xo2 = 3;
[yn2, yo2] = advance(xn2, xo2,1)

//EX3
function [yn, yorigin] = fold(xn, xorigin)
    yorigin = length(xn)- xorigin + 1;
    yn = xn($:-1:1);
    nx = linspace(-xorigin + 1, length(xn) - xorigin, length(xn));
    ny = linspace(-yorigin + 1, length(yn) - yorigin, length(yn));
    //figure
    scf(3);
    subplot(2,1,1);
    plot2d3(nx,xn,style=2);
    title("xn3");
    subplot(2,1,2);
    plot2d3(ny,yn,style=5);
    title("yn3");
    endfunction
xn3 = [1,-2,3,6];
xo3 = 3;
[yn3, yo3]=fold(xn3, xo3);

//EX4
function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    yorigin = min(x1origin, x2origin);

    tmp = abs(x1origin - x2origin);
    L1 = length(x1n);
    L2 = length(x2n);
    Lmax = max(L1 + tmp, L2 + tmp);

    if x1origin > x2origin then
        x1n = [x1n, zeros(1, tmp)];
        x2n = [zeros(1, tmp), x2n];
    else
        x2n = [x2n, zeros(1, tmp)];
        x1n = [zeros(1, tmp), x1n];
    end
    yn = x1n + x2n;
    nx = -yorigin + (1:Lmax);  
    ny = nx; 

    //figure
    scf(4);

    subplot(3, 1, 1);
    plot2d3(nx, x1n, style=2);
    title("x1n");

    subplot(3, 1, 2);
    plot2d3(nx, x2n, style=3);
    title("x2n");

    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    title("yn = x1n + x2n)");
    endfunction
x1n = [0, 1, 3, -2];
x2n = [1, 1, 2, 3];
[yn4, yo4]= add(x1n, 1, x2n, 2);

//EX5
function [yn, yorigin] = multi (x1n, x1origin, x2n, x2origin)
    yorigin = min(x1origin, x2origin);

    tmp = abs(x1origin - x2origin);
    L1 = length(x1n);
    L2 = length(x2n);
    Lmax = max(L1 + tmp, L2 + tmp);

    if x1origin > x2origin then
        x1n = [x1n, zeros(1, tmp)];
        x2n = [zeros(1, tmp), x2n];
    else
        x2n = [x2n, zeros(1, tmp)];
        x1n = [zeros(1, tmp), x1n];
    end
    disp(x1n);
    disp(x2n);
    yn = x1n .* x2n;

    nx = -yorigin + (1:Lmax);  
    ny = nx; 

    //figure
    scf(5);

    subplot(3, 1, 1);
    plot2d3(nx, x1n, style=2);
    title("x1n");

    subplot(3, 1, 2);
    plot2d3(nx, x2n, style=3);
    title("x2n");

    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    title("yn = x1n * x2n");
    endfunction
x1n = [0, 1, 3, -2];
x2n = [1, 1, 2, 3];
[yn5, yo5]= multi(x1n, 1, x2n, 2);

//EX6
function [yn, yorigin] = convolution (xn, xorigin, hn, horigin)
    yn = conv(xn, hn);
    
    yorigin = xorigin + horigin;
    
    nx = -xorigin + (1:length(xn));
    nh = -horigin + (1:length(hn));
    ny = -yorigin + (1:length(yn));
    // figure
    scf(6);
    subplot(3,1,1);
    plot2d3(nx, xn, style=2);
    title("Input Signal x(n)");

    subplot(3,1,2);
    plot2d3(nh, hn, style=3);
    title("Impulse Response h(n)");

    subplot(3,1,3);
    plot2d3(ny, yn, style=5);
    title("Output Signal y(n) = x(n) * h(n)");
    endfunction
[yn, yorigin] = convolution([1, 2, 1], 2, [1, -1, 2], 1);
