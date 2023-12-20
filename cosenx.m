function cosenx()
format long
% Pedimos al usuario el valor de x
x = input('Ingrese el valor de x a evaluar en la funcion: ');
% Pedimos al usuario el valor de n, numero de terminos a evaluar
n = input('Ingrese el valor de n, el numero de terminos a evaluar: ');
% Pedimos al usuario seleccionar una de las opciones para determinar la
% necesidad de conversion o no
opc = input('Ingrese (1) si el valor de x esta en GRADOS y (2) si el valor esta en RADIANES ');
% Si la opcion elegida es 1 GRADOS, entonces se realiza la respectiva
% conversion a RADIANES
if isequal(opc,1)
    x=deg2rad(x);
    disp(['La conversion de grados a radianes es de: ' num2str(x)])
    % Se llama a la funcion iteracion que definirá la serie de Maclaurin
    iteracion(x)
% Si la opcion elegida es 2, RADIANES, entonces se puede llamar
% directamente a la funcion de Maclaurin
elseif isequal(opc,2)
    iteracion(x)
% Si la opcion elegida es alguna otra se lanza un aviso de error
else
    disp('Opcion Incorrecta')
end

% Definimos el polinomio de Maclaurin mediante una iteracion que suma la
% serie desde 0 hasta n
    function iteracion(x)
        suma=0;
        for k=0:n
            coeficiente =((-1)^k) * ((x^(2*k))/factorial(2*k)) ;
            suma = suma +coeficiente;
            disp(['El resultado del termino ' num2str(k)])
            disp(coeficiente)
            if (k== n) 
             disp(['Por tanto, el polinomio de Maclaurin de f(x)=cos(x) con x definida en ' num2str(x) ' y evaluado en ' num2str(n) ' terminos es:'])
            disp(suma)
            end
        end
       
    end

% Graficamos ambas funciones
intervalo = input('Ingrese el intervalo a graficar como un vector [a, b]: ');
% Definir el intervalo a graficar
x = linspace(intervalo(1), intervalo(2), 1000);
% Definir la función cos(x) original
cosx = cos(x);
% Aproximar la función cos(x) mediante una función polinómica de grado n
% utilizada para la grafica
p = zeros(size(x));
for k = 0:n
    p = p + (-1)^k*x.^(2*k)/factorial(2*k);
end
% Graficar la función cos(x) original y la aproximación polinómica
plot(x, cosx, 'b', x, p, 'r--');
% Configurar el título y las etiquetas de los ejes
title(['Aproximación Polinómica de Cos(x) con n = ', num2str(n)]);
xlabel('x');
ylabel('y');
legend('Función Cos(x) Original', 'Aproximación Polinómica');
end

