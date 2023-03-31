%Nil Marc Badilles

clc;
clear;

disp('RUNGE KUTTA METHOD');
disp('----REMINDER: input "@(t,y)" before writing the fxn----');
f = input('Enter your function: ');
t0 = input('Enter initial value of independent variable: ');
y0 = input('Enter initial value of dependent variable: ');
h = input('Enter step size: ');
tn = input('Enter point at which you want to evaluate solution: ');

n = (tn-t0)/h;
t(1) = t0; y(1) = y0;

r = menu ( ' Select order of Runge Kutta', ...
 ' 2nd order ' ,' 3rd order ', ' 4th order ');
 
switch r
    case 1
        for i=1:n
            t(i+1) = t0 + i*h;
            
            k1 = h*f(t(i),y(i));
            k2 = h*f(t(i+1),y(i)+k1);
            
            y(i+1) = y(i) + (1/2)*(k1+k2);
            
            fprintf('y(%.2f) = %.4f\n',t(i+1),y(i+1))
        end
        
     case 2
        for i=1:n
            t(i+1) = t0 + i*h;

            k1 = h*f(t(i),y(i));
            k2 = h*f(t(i)+(h/2),y(i)+(k1/2));
            k3 = h*f(t(i)+h,y(i)+(2*k2)-k1);
            
            y(i+1) = y(i)+ (1/6)*(k1+(4*k2)+k3);
            
            fprintf('y(%.2f) = %.4f\n',t(i+1),y(i+1))
        end
        
    case 3
        for i=1:n
            t(i+1) = t0 + i*h;
            
            k1 = h*f(t(i),y(i));
            k2 = h*f(t(i)+(h/2),y(i)+(k1/2));
            k3 = h*f(t(i)+(h/2),y(i)+(k2/2));
            k4 = h*f(t(i)+h,y(i)+k3);
            
            y(i+1) = y(i) + (1/6)*(k1+2*k2+2*k3+k4);

            fprintf('y(%.2f) = %.4f\n',t(i+1),y(i+1))
        end
end