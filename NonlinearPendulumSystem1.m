syms x1 x2 x3 u g m l
g = 9.81; 
m = 1; 
l = 1;
f = [x2; x3; -m*g*l*sin(x1)/l^2 + u];
x_bar = [0; 0; 0];
u_bar = 0; 
A = double(subs(jacobian(f, [x1, x2, x3]), [x1, x2, x3, u], [x_bar(1), x_bar(2), x_bar(3), u_bar]));
B = double(subs(jacobian(f, u), [x1, x2, x3, u], [x_bar(1), x_bar(2), x_bar(3), u_bar]));
[V,D] = eig(A);
eigenvalues = diag(D);
eigenvectors = V;
if all(real(eigenvalues) < 0)
    disp('ÇáäÙÇã ãÓÊŞÑ')
else
    disp('ÇáäÙÇã ÛíÑ ãÓÊŞÑ')
end
t = 0:0.01:10;
x0 = [1; 0; 0];
[t,x] = ode45(@(t,x) A*x, t, x0);

figure
plot3(x(:,1), x(:,2), x(:,3))
xlabel('x1')
ylabel('x2')
zlabel('x3')
title('ãÓÇÑÇÊ ÇáØæÑ')
grid on