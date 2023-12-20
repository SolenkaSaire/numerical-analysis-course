function rungekutta4()
%Se limpia el espacio de trabajo y se borran todas las variables existentes.
clc; clear; close;
%Condición inicial establecida para y0
y0 = 1;
%Tamaño de incremento, este valor determina la distancia entre los puntos en los que se evaluará la solución aproximada.
h = 0.1;
%Se establecen los valores iniciales y finales para la variable x. Para este ejemplo, tomaremos, xi = 1 y xf = 2.
%valor inicial del vector x
xi = 1;
%valor final del vector x
xf = 2;
%Se crea el vector x utilizando la función linspace para generar una secuencia de valores desde xi hasta xf, con un incremento de h.
x = (xi:h:xf);
%Se prelocaliza el vector solución y como un vector de ceros del mismo tamaño que x.
y = zeros(size(x));
%Condición inicial (solución en x = 1)
y(1) = y0;
%Método de RK4
%Comienza el bucle para calcular la solución aproximada utilizando el método de Runge-Kutta de orden 4. El bucle se repite desde n = 1 hasta el número de elementos en x menos 1.
for n = 1:(numel(x)-1)
k1 = 3*x(n)*y(n); %primera aproximación a la pendiente
k2 = 3*(x(n)+ 0.5*h)*(y(n)+ 0.5*h*k1); %segunda aproximación a la pendiente
k3 = 3*(x(n)+ 0.5*h)*(y(n)+ 0.5*h*k2); %tercerea aproximación a la pendiente
k4 = 3*(x(n)+h)*(y(n)+h*k3); %cuarta aproximación a la pendiente
%Luego, se actualiza el valor de y(n+1) utilizando la fórmula del método de Runge-Kutta de orden 4, que combina los coeficientes k1, k2, k3 y k4 ponderados por los factores h/6.
y(n+1) = y(n) + (h/6)*(k1 + 2*k2 + 2*k3 + k4) %aproximación a la solución
end
%Se define un vector Xexacta para la solución exacta de la ecuación %diferencial. Se utiliza la función linspace para generar una secuencia %de valores desde xi hasta xf, con un incremento más pequeño de 0.001.
Xexacta = (xi:0.001:xf);
%Se calcula yExacta como la solución exacta de la ecuación diferencial %dy/dx = 3xy utilizando la fórmula yExacta = %(1/4.4817)*exp((3/2)*Xexacta.^2).
yExacta = (1/4.4817)*exp((3/2)*Xexacta.^2);
%Gráfica
%Se crea una gráfica para comparar la solución aproximada y la solución %exacta. Se traza la solución aproximada en color azul, con marcadores %circulares y un ancho de línea de 2. Luego, se traza la solución exacta %en color rojo con un ancho de línea de 2.
plot(x,y,'b','Marker','o','LineWidth',2);
hold on;
plot(Xexacta,yExacta,'r','LineWidth',2);
legend('y_{Aprox}','y_{Exacta}','fontsize',14,'FontWeight','bold');
xlabel('xi');
ylabel('fi');
set(gcf,'color','w');
set(gca,'linew',1.5,'fontsize',16,'FontWeight','bold');
grid on;
hold off;

