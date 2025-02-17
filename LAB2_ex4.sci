 n = -5:5;
 ur = bool2s(n >= 0) .* n;
 plot2d3(n, ur)
 xlabel("n")
 ylabel("u_r(n)")
 title("Unit Ramp Signal")
