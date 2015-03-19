function input_rexp(TX,RX,distancia)

TX=upper(TX);
RX=upper(RX);
%============TX=====================

switch TX
    case{'NPM','NPM1','npm'}
        freq =21.4;
        latt =+21.417;
        longt=158.15;
        pw   =640;
    case{'NAA','naa'}
        
        freq =24.000;
        latt =44.633;
        longt=67.283;
        pw   =1000;
        
    case{'NAU','nau'}
        freq =28.5;
        latt =18.6;
        longt=67.178;
        pw   =1;
    case{'NDKL','NDK-L','NDKV','NDK-V','NDK'}
        freq =25.2;
        latt =46.36;
        longt=98.33;
        pw   =10;
    case{'NLK','nlk'}
        freq=24.8
        latt=48.2
        longt=121.917
        pw=130
    case{'nsy','NSY'}
        freq=49.5;
        latt=37.154;
        longt=-14.387;
        pw=250;
        
        
%         case{'NDKV','NDK-V'}
%         freq =25.2;
%         latt =46.36;
%         longt=98.33;
%         pw   =10;
            
    otherwise
            disp('Transmissor n?o encontrado')
            return
end

%============RX=====================


switch RX
    case {'ATI','ati','ATB','atb'}
lat  = -23.18;
long = 46.55;

    case {'CAS','cas'}
lat  = -31.7992;
long = 68.52;

    case {'ICA','ica'}
lat  = -14.16;
long = 75.73;
    case {'PAL','pal'}
lat  = -10.16;
long = 49.33;
    case {'PIU','piu'}
lat  = -5.2;
long =  80.63;
    case {'PLO','plo'}
lat  = -12.504216;
long =  76.797731;
    case {'STM','stm','SMS','sms'}
lat  = -29.71;
long =  53.72;
    case {'BEACF','beacf','EACF','eacf'}
lat  = -62.83;
long = 58.40;
    case{'italy','ITALY'}
 lat=52.0;
 long=-8.0;
     case {'MEX','mex'}
lat  = 19.33;
long =  99.18;
 otherwise
            disp('Receptor n?o encontrado')
            return
end

altRX=0;
%============distance TX-RX=====================


 %wgs84 = almanac('earth','wgs84','kilometers'); 
% 
 %D=distance([lat,-long],[latt,-longt],wgs84);
% [range,ln,lt]=m_lldist([-long -longt],[lat  latt],40);

%============gravando informa?oes=====================

 fid=fopen('/home/akel/desktop/lwpcv21/rexp.inp','r+');
 format bank
lineTX=['tx-data','     ',upper(TX)];

lineRX=['receivers','     ',num2str(lat),' ', num2str(long)];



linedist=['range-max','     ',num2str(distancia)];

line14=['  Choose bearing angle at 24'];

 

 for i=1:4
      fgets(fid);
 end

%input TX (linha 5)
fseek(fid,0, 'cof');
fwrite(fid,lineTX);

 for i=5:8
      fgets(fid);
 end
 
 fseek(fid,0, 'cof');
 fwrite(fid,linedist);
 fwrite(fid,line14);
 
% 
%   for i=9:10
%       fgets(fid);
%  end
%   

 %informa?oes receptores RX 15
  %  fseek(fid,0, 'cof');
  %  fwrite(fid,lineRX);


  fclose(fid);
  
   