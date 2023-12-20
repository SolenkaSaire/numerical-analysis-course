function errorCuadrado()
    A = [1 1; 1 -2; 1 3; 1 4];
    Y = [4 5 -1 1];

    % Ajuste lineal
    coeficientesLineales = inv(A' * A) * A' * Y';
    b = coeficientesLineales(1);
    m = coeficientesLineales(2);

    % Ajuste cuadrático
    G = [ones(4, 1), A(:, 2), A(:, 2).^2];
    coeficientesCuadraticos = inv(G' * G) * G' * Y';
    a1 = coeficientesCuadraticos(1);
    b1 = coeficientesCuadraticos(2);
    c1 = coeficientesCuadraticos(3);

    % Datos de entrada
    X = A(:, 2);

    % Estimación de Y para ajuste lineal y cuadrático
    Y_estimado_lineal = b + m * X;
    Y_estimado_cuadratico = a1 + b1 * X + c1 * X.^2;

    % Cálculo de errores cuadráticos medios
    error_lineal = mean((Y - Y_estimado_lineal).^2);
    error_cuadratico = mean((Y - Y_estimado_cuadratico).^2);

    disp(['Error cuadrático medio para ajuste lineal: ', num2str(error_lineal)]);
    disp(['Error cuadrático medio para ajuste cuadrático: ', num2str(error_cuadratico)]);

    % Mensaje indicando el mejor ajuste
    if error_lineal < error_cuadratico
        disp("El mejor ajuste es lineal");
    else
        disp("El mejor ajuste es cuadrático");
    end
end
