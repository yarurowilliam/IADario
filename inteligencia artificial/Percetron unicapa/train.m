classdef train
    methods(Static)
        
        function [listaError,listaIteracion,pesoideal,umbralideal]=Entrenar(noIteraciones, ErrorPermitido, patronesEntrada, salida, pesos,umbral,rata)
            iteracionActual=1;
            errorActual=9999;
            soma=1;
            metodos = metodosUtil;
            while iteracionActual<=noIteraciones && errorActual >= ErrorPermitido
                patronActual=1;
                yr=[0];
                el=[0];
                ep=[0];
                while patronActual <= size(patronesEntrada,1)
                    s=[0];
                    for i = 1 : 1
                        for j = 1 : size(patronesEntrada,2) 
                            xj=patronesEntrada(patronActual,j);
                            wji=pesos(i,j);
                            s(i)=s(i)+(xj*wji);
                        end
                        s(i)= s(i)-umbral;
                        yr(i)= metodos.Escalon(s(i));
                        el(i)= salida(patronActual)-yr(i);
                    end
                    ep(patronActual)=metodos.CalcularErrorPatron(1, el);
                    [pesos,umbral]=metodos.CalcularNuevosParametros(pesos, el, patronActual, rata, 1, 2, patronesEntrada, umbral);
                   pesoideal=pesos;
                    umbralideal=umbral;
                    patronActual=patronActual+1;
                end
                
                erms=metodos.CalcularERMS(size(patronesEntrada,1), ep);
                errorActual=erms;
                listErms(iteracionActual)=erms;
                listIteraciones(iteracionActual)=iteracionActual;
                iteracionActual=iteracionActual+1;
            end
            
            listaError=listErms;
            listaIteracion=listIteraciones;
        end
       
        function [yr] = simular(peso,patron,umbral)
             metodos = metodosUtil;
        noentrada = size(peso,2);
        s=[0];
            for i=1 :1 
                for j=1 :noentrada
                xj=patron(j);
                wji=peso(i,j)
                s(i)=s(i)+ (xj * wji);
                end
              
                 s(i) = s(i) - umbral;
                  yr(i) = metodos.Escalon(s(i));
            end
        end
        
           
    end
 end