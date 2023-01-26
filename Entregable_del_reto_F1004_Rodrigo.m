%Programa para uso de do-while en menus
clear all;
clc;
opcion=1;
%Título
   fprintf("\n────────────────────────────────────────────────────────────────────────────")
   fprintf("\n─██████──██████─██████████████─██████─────────██████████████─██████████████─")
   fprintf("\n─██░░██──██░░██─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██─██░░░░░░░░░░██─")
   fprintf("\n─██░░██──██░░██─██░░██████░░██─██░░██─────────██░░██████████─██░░██████░░██─")
   fprintf("\n─██░░██──██░░██─██░░██──██░░██─██░░██─────────██░░██─────────██░░██──██░░██─")
   fprintf("\n─██░░██──██░░██─██░░██──██░░██─██░░██─────────██░░██─────────██░░██████░░██─")
   fprintf("\n─██░░██──██░░██─██░░██──██░░██─██░░██─────────██░░██─────────██░░░░░░░░░░██─")
   fprintf("\n─██░░██──██░░██─██░░██──██░░██─██░░██─────────██░░██─────────██░░██████░░██─")
   fprintf("\n─██░░░░██░░░░██─██░░██──██░░██─██░░██─────────██░░██─────────██░░██──██░░██─")
   fprintf("\n─████░░░░░░████─██░░██████░░██─██░░██████████─██░░██████████─██░░██──██░░██─")
   fprintf("\n───████░░████───██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─")
   fprintf("\n─────██████─────██████████████─██████████████─██████████████─██████──██████─")
   fprintf("\n────────────────────────────────────────────────────────────────────────────")
   fprintf("\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCREADOR:")
   fprintf("\n\n\t\t\t\t\t\t\t\t\t\t\t   Rodrigo López Guerra - A01737437")
   fprintf("\n\n\n\t\t\t\t\t\t\t\t\t\t  Presione cualquier botón para continuar...")
   pause;
while opcion ~= 0
   clc
   fprintf("\n\t\t\t\t\t\t\t\t\t\t° ° ° ° ° ° ° ° ° ° ° ° ° °")
   fprintf("\n\t\t\t\t\t\t\t\t\t\t\t\t  M E N Ú")
   fprintf("\n\t\t\t\t\t\t\t\t\t\t° ° ° ° ° ° ° ° ° ° ° ° ° °")
   fprintf('\n\n\t1. Caso 1.');
   fprintf('\n\t2. Caso 2.');
   fprintf('\n\t3. Caso 3.');
   fprintf('\n\t0. Salir.');
   if opcion ~= 1
       if opcion ~= 2
           if opcion ~= 3
               fprintf("\n\nEscribe tu opción: ");
               fprintf(int2str(opcion));
               fprintf('\n\tOpción no válida.');
           end;
       end;
   end;
   opcion=input('\n\nEscribe tu opcion: ');
   clc
   switch opcion
       case 1
           clear all;
            clc;
            
            %Vo = metros/segundos | alfa= Grados | Altura = Metros

            Vo=230;
            alfa=45;
            altura=5426;
            g=9.81;
            alfa=alfa*pi/180;

%Para el análisis de la función del volcán, se necesita hacer una función
%para indicar dónde va a parar la parábola. La función del volcán fue
%calculada con GeoGebra. No es exacto el valor.
            for x=1:10000
                y2=(tan(alfa).*x)-(0.5*g/(Vo*cos(alfa))^2)*(x.^2)+altura;
                v=altura+altura*cos(1/17460*x-300); %Función sacada de GeoGebra
                if v<=y2
                    z=x;
                end

            end

            x=0:0.1:10000;
            v=altura+altura*cos(1/17460*x-300);
            plot(x,v,"linewidth",4,...
                "Color","None");

            hold on

             I = imread('volcano.png');
             J=flip(I);
             h = image(xlim,ylim,J);
             uistack(h,'top')


            for i=1:90:z
                y2=(tan(alfa).*i)-(0.5*g/(Vo*cos(alfa))^2).*(i.^2)+altura;
                hold on;
                pause(0.01);

                I = imread('sky.png');
                J=flip(I);
                h = image(xlim,ylim,J);
                uistack(h,'bottom')
                pause(0.01);

                p1 = plot(i,y2,'b*','MarkerSize',8,'LineWidth',2,...
                    'Color',"red");
                title('Caso 1')
                xlabel('Longitud (m)')
                ylabel('Altitud (m)')
                axis([0 7500 2650 7000]);
            end

            Vo=150;
            alfa=30;
            g=9.81;
            alfa=alfa*pi/180;

            for x=1:10000
                y2=(tan(alfa).*x)-(0.5*g/(Vo*cos(alfa))^2)*(x.^2)+altura;
                v=altura+altura*cos(1/17460*x-300);
                if v<=y2
                    z=x;
                end

            end

            for i=1:90:z
                y2=(tan(alfa).*i)-(0.5*g/(Vo*cos(alfa))^2).*(i.^2)+altura;
                hold on;
                pause(0.01);

                p2 = plot(i,y2,'b*','MarkerSize',8,'LineWidth',2,...
                    'Color',"green");
                axis([0 7500 2650 7000]);
            end

            Vo=150;
            alfa=78;
            g=9.81;
            alfa=alfa*pi/180;

            t=(2*(-Vo*sin(alfa)/(-g)))+((((Vo*sin(alfa))^2+2*(-altura)*(-g))^0.5)-(Vo*sin(alfa)))/g;
            xmax=Vo*cos(alfa)*t;
            ymax=((Vo*sin(alfa))^2)/(2*g);

            tvector=0:0.05:t;
            y=(Vo*sin(alfa)).*tvector-(0.5*g).*(tvector.^2)+altura;

            for x=1:10000
                y2=(tan(alfa).*x)-(0.5*g/(Vo*cos(alfa))^2)*(x.^2)+altura;
                v=altura+altura*cos(1/17460*x-300);
                if v<=y2
                    z=x;
                end

            end

            for i=1:100:z
                y2=(tan(alfa).*i)-(0.5*g/(Vo*cos(alfa))^2).*(i.^2)+altura;
                hold on;
                pause(0.01);

                p3 = plot(i,y2,'b*','MarkerSize',8,'LineWidth',2);
                legend([p1,p2,p3],{'Alcance Máximo','Tiro Típico','Tiro a 1 kilómetro'},'Location','southwest')
                axis([0 7500 2650 7000]);
            end
            hold off
            opcion=1;
            
       case 2
            clear all;
            clc;
            alfa=50;
            g=9.81;
            altura=5426;
            alfa=alfa*pi/180;
             
            dis=input("\nInserte la distancia: ");
            z=0;
            vov=200;
             
            while vov>=200 || dis<100
                for vo=1:1000
                    t=(2*(-vo*sin(alfa)/(-g)))+((((vo*sin(alfa))^2+2*(-altura)*(-g))^0.5)-(vo*sin(alfa)))/g;
                    xmax=vo*(dis/2000)*sin(alfa)*t;
                end
                vov=(sqrt((g*xmax)/sin(alfa))/10);
                if vov>200 || dis<100
                    clc;
                    fprintf("\nInserte la distancia: ")
                    fprintf(num2str(dis))
                    dis=input("\nVelocidad fuera de rango. Inserte la distancia: ");
                    vov=(sqrt((g*xmax)/sin(alfa))/10);
                end;
                t=(2*(-vov*sin(alfa)/(-g)))+((((vov*sin(alfa))^2+2*(-altura)*(-g))^0.5)-(vov*sin(alfa)))/g;
                xmax=vov*cos(alfa)*t;
                ymax=((vov*sin(alfa))^2)/(2*g);
                tvector=0:0.05:t;
                y=(vov*sin(alfa)).*tvector-(0.5*g).*(tvector.^2)+altura;
                for x=1:7460
                    y2=(tan(alfa).*x)-(0.5*g/(vov*cos(alfa))^2)*(x.^2)+altura;
                    v=altura+altura*cos(1/17460*x-300);
                    if v<=y2
                        z=x;
                    end
                end
             end
             fprintf("\nÁngulo: 45°.\nTiempo: ")
             fprintf(num2str(t))
             fprintf(" segundos.\nVelocidad (m/s): %d" ,vov)
             x=0:0.1:7400;
             v=altura+altura*cos(1/17460*x-300);
             plot(x,v,"linewidth",4,...
                "Color","None");

             hold on

             I = imread('volcano.png');
             J=flip(I);
             h = image(xlim,ylim,J);
             uistack(h,'bottom')

             for x=1:10000
                y2=(tan(alfa).*x)-(0.5*g/(vov*cos(alfa))^2)*(x.^2)+altura;
                v=altura+altura*cos(1/17460*x-300);
                if v<=y2
                    z=x;
                end
             end
             
             for i=1:90:z
                y2=(tan(alfa).*i)-(0.5*g/(vov*cos(alfa))^2).*(i.^2)+altura;
                hold on;
                pause(0.01);

                I = imread('sky.png');
                J=flip(I);
                h = image(xlim,ylim,J);
                uistack(h,'bottom')
                pause(0.01);

                p4= plot(i,y2,'b*','MarkerSize',8,'LineWidth',2,...
                    'Color',"black");
                title('Caso 2')
                xlabel('Longitud (m)')
                ylabel('Altitud (m)')
                legend(p4,{'Tiro con Distancia Personalizada'},'Location','southwest')
                axis([0 7500 2650 7000]);
             end
             hold off;
             opcion=1;
             fprintf("\n\n\tPresiona cualquier botón para continuar...");
             pause;

       case 3
            clear all;
            clc;
            Vo=input("\nInserte su Velocidad Inicial: ");
            while Vo>200 || Vo<100
                    clc;
                    fprintf("\nInserte su Velocidad Inicial: ")
                    fprintf(num2str(Vo))
                    Vo=input("\nVelocidad fuera de rango. Inserte su Velocidad Inicial: ");
            end;
            g=9.81;
            altura=5426;
            alfa=input("\nInserta tu ángulo: ");
            while alfa>85||alfa<1
                    clc;
                    fprintf("\nInserte su Velocidad Inicial: ")
                    fprintf(num2str(Vo))
                    fprintf("\nInserta tu ángulo: ")
                    fprintf(num2str(alfa))
                    alfa=input("\nÁngulo fuera de rango. Inserta tu ángulo: ");
            end;
            alfagrad=alfa;
            alfa=alfa*pi/180;
            z=0;

            t=(2*(-Vo*sin(alfa)/(-g)))+((((Vo*sin(alfa))^2+2*(-altura)*(-g))^0.5)-(Vo*sin(alfa)))/g;
            xmax=Vo*cos(alfa)*t;
            ymax=((Vo*sin(alfa))^2)/(2*g);

            tvector=0:0.05:t;
            y=(Vo*sin(alfa)).*tvector-(0.5*g).*(tvector.^2)+altura;
             fprintf("\nÁngulo: ")
             fprintf(num2str(alfagrad))
             fprintf("°.\nTiempo: ")
             fprintf(num2str(t))
             fprintf(" segundos.\nVelocidad (m/s): %d" ,Vo)
             x=0:0.1:7400;
             v=altura+altura*cos(1/17460*x-300);
             plot(x,v,"linewidth",4,...
                "Color","None");

             hold on

             I = imread('volcano.png');
             J=flip(I);
             h = image(xlim,ylim,J);
             uistack(h,'bottom')

             for x=1:10000
                y2=(tan(alfa).*x)-(0.5*g/(Vo*cos(alfa))^2)*(x.^2)+altura;
                v=altura+altura*cos(1/17460*x-300);
                if v<=y2
                    z=x;
                end
             end
             
             for i=1:90:z
                y2=(tan(alfa).*i)-(0.5*g/(Vo*cos(alfa))^2).*(i.^2)+altura;
                hold on;
                pause(0.01);

                I = imread('sky.png');
                J=flip(I);
                h = image(xlim,ylim,J);
                uistack(h,'bottom')
                pause(0.01);

                p5= plot(i,y2,'b*','MarkerSize',8,'LineWidth',2,...
                    'Color',"magenta");
                title('Caso 3')
                xlabel('Longitud (m)')
                ylabel('Altitud (m)')
                legend(p5,{'Tiro con Ángulo y Velocidad Personalizada'},'Location','southwest')
                axis([0 7500 2650 7000]);
             end
             hold off;
             opcion=1;
             fprintf("\n\n\tPresiona cualquier botón para continuar...");
             pause;
      
   end;
  
end;