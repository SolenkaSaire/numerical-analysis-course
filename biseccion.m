function biseccion()
% Declaramos variable simbólica "x"
syms x;
% Dejamos numeros en formato float
format long;
% Almacena funcion ingresada para buscar la raiz
% Se pide la funcion en caracteres
funcion = input ('Ingrese la funcion: f(x)= ', 's' ) ;
% Solicita la entrada por el usuario
f= inline (funcion);
a= input ('Ingrese el limite inferior del intervalo : a= ') ;
b= input ('Ingrese el limite superior del intervalo : b= ') ;


errorTolerado = input ('ingrese el error a aproximarse a la raiz ') ;
tipoError = input ('Ingrese "1" si desea hallar el error absoluto o ingrese "2" si desea hallar el error relativo : ' );

% Comprueba condiciones de teorema
if a>b
    disp ( 'Los valores elegidos no cumplen parametros del teorema de valor intermedio; a<b ' )
end

% Comprueba si algun valor corta con el eje x
c=0;
if f(a)*f(b) >0
    disp ( 'Ningun valor se corta con el eje x, no se cumple el teorema' )
else
    % Se llama la funcion opciones con el metodo de biseccion de acuerdo a
    % la opcion elegida
    opciones(f,a,b,errorTolerado,tipoError);
end
% Graficamos la funcion
ezplot( funcion ); 
grid on;
end


% Se crea la nueva funcion utilizada en la funcion biseccion
function opciones(f,a,b,errorTolerado,tipoError)
% Se define el valor anterior para calcular el error de cada intervalo
valorAnteriorError=0;
% Se define el contador de iteraciones
cont=1;
% Separamos cada caso con un switch tipoError, absoluto o relativo
switch tipoError
    case 1
        % Mientras que el valor absoluto de b-a sea mayor a la tolerancia
        % del error se continuara el ciclo
        while (abs (( b-a )) > errorTolerado )
            % Se suma una nueva iteracion
            cont = cont +1;
            % Se calcula el valor medio del intervalo
            c=(a+b)/2;
            % Se define si el valor evaluado es positivo o negativo para
            % reemplazarlo en la siguiente iteracion
            if f(a)*f(c) <=0
                b=c ;
            else
                a=c ;
            end
        end

    case 2
         % Se calcula el valor medio del intervalo
        c=(a+b) /2;
        % Mientras que el porcentaje de error absoluto hallado sea mayor a la tolerancia
        % del error se continuara el ciclo
        while ((abs ((c -valorAnteriorError)/ c )*100) > errorTolerado*100 )
            % Se suma una iteracion
            cont = cont +1;
            % Se otorga el valor del error a c
            valorAnteriorError=c;
            % Si la evaluacion de la funcion en a y c es negativo, se
            % reemplaza el valor de a en c
            if f(a)<0
                if f(c)<0
                    a=c ;
                else
           % Por el contrario, si la evaluacion de a es negativo pero en c
           % positivo, se reemplaza b en c
                    b=c ;
                end
           % De otro modo, se hacen las mismas decisiones con respecto a el
           % valor en b
            elseif f(b)<0
                if f(c)<0
                    b=c ;
                else
                    a=c ;
                end
            end
            % Se calcula el valor intermedio entre los nuevos valores
            % ubicados en a y b
            c=(a+b) /2;
        end
    otherwise
        disp("escriba una opcion valida");
end

c=(a+b) /2;
% Se procede a detallar la cantidad de iteraciones en i
disp ('la cantidad de iteraciones fue:')
disp ('i=' )
disp (cont)
% Se procede a especificar la raiz aproximada en la funcion 
disp ('la raiz en la funcion con el error esperado es:')
disp ('X=')
disp (c)


end