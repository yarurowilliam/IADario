clear
myObj = train;

x1=[1, 1, 0, 0];
x2=[1, 0, 1, 0];

patronesEntrada=[x1',x2']
patron=[1,1,1];
%patronesEntrada(2,2)
%patronesEntrad(fila,columna)
salida=[1;0;0;0];
pesos=[-0.5, -0.2,0.3];
%salida(3)
clc
%s=[0];
%s(1)=2;
%s(1)
%s(2)=5;
%s
[error,itera,pesoideal,umbralideal] = myObj.Entrenar(100, 0.1, patronesEntrada, salida, pesos,0,0.1)
y=myObj.simular(pesoideal,patron,umbralideal)
