classdef metodosUtil
    methods(Static)
        function [a]=Escalon(s)
            if s>=0
                a=1;
            else
                a=0;
            end
        end
        function [a]=CalcularErrorPatron(numeroSalidas, el)
            resultado=0;
            for i=1:numeroSalidas
                resultado=resultado+abs(el(i));
            end
            a=resultado/numeroSalidas;
        end
        function [a,b]=CalcularNuevosParametros(pesos, el, patronActual, rata, numeroSalidas, numeroEntrada, patronesEntradas, umbral)
            for i=1:numeroSalidas
                for j=1:numeroEntrada

                    nuevosPesos=pesos(i,j)+(rata*el(i)*patronesEntradas(patronActual,j));
                    pesos(i,j)=nuevosPesos;
                end
                umbral=umbral+(rata*el(i)*1);
            end
            a=pesos;
            b=umbral;
        end
        function [a]=CalcularERMS(numeroPatrones, ep)
            rms=0;
            for i=1:numeroPatrones
                rms=rms+ep(i);
            end
            a=rms/numeroPatrones;
        end
    end
end