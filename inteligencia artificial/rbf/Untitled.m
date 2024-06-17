%RED RBF (FUNCION DE BASE RADIAL)

%Generar centros radiales
%-

  centros_Rad =min(min(entrada))+(max(max(entrada))-min(min(entradas))).*rand(cantidad_centro_radial,cantidad_entradas);

%Calcular Distancia euclidiana  y funcion de activacion 
DistanciasEuclidianas=[];
FuncionBaseRadial=[];
acum=0;

for i=1:cantidad_patrones
   
    for j=1:cantidad_centro_radial
        acum=0;
    for k=1:cantidad_entradas
    acum=acum+((entrada(i,k))-(centros_Rad(j,k)))^2;
    end
    DistanciasEuclidianas(i,j)=sqrt(acum);
    %Funcion de activacion para las distacias
    FuncionBaseRadial(i,j)=(sqrt(acum)^2)*log(sqrt(acum));
    end
end
% creacion de matriz de interpolacion

unos=ones(cantidad_patrones,1);
matrizInterpolacion=[unos FuncionBaseRadial];
err=0;


Incognitas=matrizInterpolacion\salida;
  resultado=matrizInterpolacion*Incognitas;
  for i=1:n_patrones
      err=abs(salidas(i)-resultado(i));
  end
