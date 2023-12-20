function lagrange()
% Pedimos al usuario el valor de xi a evaluar
Xi = input('Ingrese los valores del vector xi a evaluar: ');
% Pedimos al usuario el valor de fi a evaluar
Fi = input('Ingrese los valores del vector fi a evaluar: ');
% Se obtiene el número de elementos que contiene el vector xi
n=length(Xi);
% Se toma x como variable del polinomio
syms x;
%Se toma como referencia el primer par ordenado que inicia en 0
P=0;
% Calcular el polinomio de interpolación de Lagrange
for k=1:n
   Lk=1;
   % Productoria
   for i=1:n
       if(i~=k) % Solo se realiza la operacion si i es diferente de k
           % Cálculo del término de Lagrange
           %El numerador siempre se construye a partir de lo que ya tenia
           %(el numerador mismo) multiplicado por todos los elementos x -
           %xi el cual itera sobre toda la fila de xi
           Lk=Lk*(x-Xi(i))/(Xi(k)-Xi(i));
       end
   end
   % Imprimir el término de Lagrange actual calculado
   fprintf('L%d',k)
   % Expandir y simplificar el término de Lagrange
   Lk=expand(Lk);
   % Sumar al polinomio de interpolación
   P=P+Fi(k)*Lk;
end
fprintf('\nEl polinomio de interpolacion es: ')
P=simplify(P) % simplificará el polinomio lo más posible
%Realizar la grafica
plot(Xi,Fi, 'bo', 'MarkerSize', 8, 'LineWidth', 1.5)% Trazar los puntos de la tabla
hold on % Mantener la gráfica activa para agregar más elementos
% Graficar el polinomio de interpolación con límites ajustados
ezplot(P,[min(Xi), max(Xi)])
title('Interpolación Polinómica Lagrange')
xlabel('xi');
ylabel('fi');
legend('Puntos', 'Aproximación Polinómica');
grid on; % Agregar cuadrícula
hold off% Finalizar la edición de la gráfica
end
