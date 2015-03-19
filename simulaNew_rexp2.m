clear all
close all
clc
inicio=datestr(now)
% define o caminho
%  NPM-ATI --ok
% calcula o angulo zenital para hora/dia



%===INPUT Range EXPponential
TX='NAA';
RX='ATI';
%=*=MUDAR A DISTANCIA MANUALMENTE!!..problem?
input_rexp(TX,RX,6000)
break
%DEFINICAO RANGE 
ndx0=[0:200:6460];
B=zeros(length(ndx0),1);
H=B;
H(:)=74;
B(:)=0.3;
temp=[ndx0' B H];
changerexp3(temp);
!rexp.cmd



%Defini??o das Datas
for MM=12:12
    Ad(1,1)=2007;
    Ad(2,1)=MM;
    Ad(3,1)=18;
    hh=[13:13] ;%horas
    %Calculo das latitudes
    
    [A]=get_latlong;
    ndx=A(:,2);
    lt=A(:,3);
    lg=A(:,4);
    A(:,4)=A(:,4)
    ndx=A(:,2);
    N=length(A);
    

    
    l=0 
    for i=1:length(hh);
        for j=[20];        %minutos
            for DH=[-1.60];  %parametro H
                for DB=[0.020]; %parametro beta
                    ph=num2str(DH)
                    pb=num2str(DB)
                    Ad(4,1)=hh(i);
                    Ad(5,1)=j;
                    l=l+1
                    
                    filename1=['teste.' num2str(Ad(4,1)) '.' num2str(Ad(5,1)) '.mcrae.rho.40Mcrae1.' ph '.' pb '.dat'];
                    filename2=['log.' num2str(Ad(4,1)) '.' num2str(Ad(5,1)) '.mcrae.rho.40Mcrae1.' ph '.' pb '.dat'];
                    filename3=['zenite.' num2str(Ad(3,1)) '.' num2str(Ad(2,1)) '.' num2str(Ad(1,1)) 'N.dat'];
                    
                    X1=zenite_caminho(Ad(1,1),Ad(2,1),Ad(3,1),Ad(4,1),Ad(5,1),A);
                    
                    mean(X1)
                    
                    %Q1(:,l)=X1;
                    
                    [X B H]=polyh(X1,DH,DB);
                    Q(:,l)=X;
                    C(:,1)=X';
                    C(:,2)=B;
                    C(:,3)=H;
                    
                    temp=[ndx B' H'];
                    %
                    changerexp3(temp);
                    disp([ hh(i) j])
                    !rexp.cmd
                    
                    
                    temp=load('teste.dat')
                    MES=datestr(datenum(Ad(2,1),Ad(2,1),Ad(3,1),0,0,0),'mmmm')
                    dir1=['C:\LWPCv21\Matlab_routinesLWPC\caminho_heterogeneo\variando_zenite\novo\Solar_flares\NAAPLO\' MES '\' filename1];
                    %dir1=['C:\LWPCv21\Matlab_routinesLWPC\caminho_heterogeneo\variando_zenite\novo\Solar_flares\NAAPLO\' MES '\diagrama1320\' filename1];
                    save(dir1,'-ascii','temp')
                    
                    P=get_chibetah_rexp;
                    dir2=['C:\LWPCv21\Matlab_routinesLWPC\caminho_heterogeneo\variando_zenite\novo\Solar_flares\NAAPLO\' MES '\' filename2];
                    %dir2=['C:\LWPCv21\Matlab_routinesLWPC\caminho_heterogeneo\variando_zenite\novo\Solar_flares\NAAPLO\' MES '\diagrama1320\' filename2];
                    save(dir2,'-ascii','P')
                    
                    clear C
                end
            end
            
        end
    end
end

%            dir3=['C:\LdWPCv21\Matlab_routinesLWPC\caminho_heterogeneo\variando_zenite\mcrae\NPMPLO\dezembro\' filename3]
%           save(dir3,'-ascii','Q')

final=datestr(now)




