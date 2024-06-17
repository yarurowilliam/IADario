% LEEMOS EL ARCHIVO DE DATOS Y DEFINIMOS LOS VECTORES DE ENTRADAS Y SALIDAS T
filename='datos.xlsx';
entradax = xlsread(filename,'B:B');
entraday = xlsread(filename,'D:D');
entradaz = xlsread(filename,'E:E');
entradaxyz=[entradax,entraday,entradaz];
salidaxyz=xlsread(filename,'F:F');

% crear e inicializar una red back-propagation
% en las capas ocultas se configura funciones de activacion no lineales(logsig y tansig)
% y en la capa de salida las funciones de activacion pueden ser lineales o
% no lineales(logsig, tansig, purelin)
red = newff([0.0 2.0; 0.0 2.0 ;-2.0 -2.0],[10.0 1.0],{'logsig','purelin'},'trainlm');

%definir parametros de entrenamiento
% numero de iteraciones
red.trainparam.epochs = 200;


% error maximo permitido
red.trainparam.goal = 0;

% rata de aprendizaje
red.trainparam.lr = 1;

% entrenar la red
red = train(red,entradaxyz,salidaxyz);

    