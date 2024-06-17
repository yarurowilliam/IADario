% definir vectores de entrada y salida deseada
P = [1 1 0 0; 1 0 1 0];
XOR = [0 1 1 0];

% crear e inicializar una red back-propagation
% en las capas ocultas se configura funciones de activacion no lineales(logsig y tansig)
% y en la capa de salida las funciones de activacion pueden ser lineales o
% no lineales(logsig, tansig, purelin)
red = newff([0 1; 0 1],[10 1],{'logsig','purelin'},'trainlm');

%definir parametros de entrenamiento
% numero de iteraciones
red.trainparam.epochs = 200;

% error maximo permitido
red.trainparam.goal = 0;

% rata de aprendizaje
red.trainparam.lr = 1;

% entrenar la red
red = train(red,P,XOR);