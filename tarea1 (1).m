%Codigo de mochila_1XD
function [peso, valor, capacidad] = GeneraMochila(n, seed)
    % Genera datos aleatorios con mi numero de cuenta
    % Parámetros:
    %  n: Numero de objetos a generar
    %  seed: mi numero de cuenta 322073678
    %  peso: pesos de los objetos
    %  valor: valores de los objetos.
    rng(seed);  
    peso = randi([1, 5], 1, n);     
    valor = randi([6, 10], 1, n);   
    capacidad = randi([10, 15]);         
end

function Valmax = mochila01(peso, valor, capacidad)
    % Usando programacion dinamica como en la clase con lo de decidir si poner o no objetos
    % Parametros:
    %  peso: pesos de los objetos
    %  valor: valores de los objetos
    n = length(peso);
    dp = zeros(n+1, capacidad+1);
    for i = 1:n
        for w = 0:capacidad
            % se decide si el objeto actual puede ser incluido en la mochila
            if peso(i) <= w
                dp(i+1, w+1) = max(dp(i, w+1), dp(i, w+1 - peso(i)) + valor(i));
            else
                dp(i+1, w+1) = dp(i, w+1);
            end
        end
        disp(dp);
    end   
    % El valor máximo se encuentra en la última celda
    Valmax = dp(n+1, capacidad+1);
end

[peso, valor, capacidad] = GeneraMochila(10, 322073678);
Valmax01 = mochila01(peso, valor, capacidad);
%
%Codigo mochila ilimitadaXD
function [peso, valor, capacidad] = GeneraMochila(n, seed)
    % Genera datos aleatorios con mi numero de cuenta
    % Parámetros:
    %   n: numero de tipos de objetos.
    %   seed: mi numero de cuenta 322073678
    %   peso: pesos de los objetos
    %   valor: valores de los objetos
    rng(seed);  
    peso = randi([2, 5], 1, n);     
    valor = randi([7, 10], 1, n);   
    capacidad = randi([10, 15]);         
end
function ValmaxINF = mochilaINF(pesos, valores, capacidad)
    % Resuelve el problema de la mochila ilimitada usando programación dinámica
    % esta vercion toma múltiples copias de cada objeto
    % Parametros:
    %   pesos: pesos de los objetos.
    %   valores: valores de los objetos.
    n = length(pesos);
    % crea un vector para almacenar el valor máximo para cada capacidad
    dp = zeros(1, capacidad+1); 
    % Bucle principal que itera sobre cada capacidad posible (desde 0 hasta la capacidad total).
    for w = 0:capacidad
        for i = 1:n
            % Checa el peso del objeto actual si es menor o igual a la capacidad actual,
            % y calcula si incluir este objeto mejora el valor total
            if pesos(i) <= w
                dp(w+1) = max(dp(w+1), dp(w+1 - pesos(i)) + valores(i));
            end
        end
        disp(dp);
    end   
    % El valor máximo se encuentra al final del vector
    ValmaxINF = dp(capacidad+1);
end
[peso, valor, capacidad] = GeneraMochila(6, 322073678);
ValmaxINF = mochilaINF(peso, valor, capacidad);