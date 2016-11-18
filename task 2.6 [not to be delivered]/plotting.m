figure
hold on 
grid on 
plot(beta*rad2deg); 
plot(x*rad2deg); 
plot(x_d*rad2deg, '--'); 
plot(psi*rad2deg); 
title('Angle comparison', 'Interpreter', 'latex'); 
legend('\beta', '\chi', '\chi_d', '\psi', 'Interpreter', 'latex'); 
xlabel('s', 'Interpreter', 'latex'); 
ylabel( '[deg]', 'Interpreter', 'latex'); 