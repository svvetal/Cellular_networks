%Free Space model/LOS
%formula Pr = (Pt*Gt*Gr*(lambda)^2)/(4pid)^2*Lo

Pt = 1500; %transmited power in watt
Gt = 4;    %transmited gain
Gr = 2;    %Receiver gain
d = 1:1:50000; %sepration between the antennas
ht = 115;      %height of transmitter
hr = 6;        %height of receiver
f = 2100*10^6; %frequency
fc = 2100;
Lo = 1;        %loss
lambda = (3*10^8)/(2100*10^6); %wavelength

%formula 
Prfree = Pt*Gt*Gr*(lambda*lambda)./(((4*pi.*d).^2)*Lo);
Prfreedb = 10*log10(Prfree);
Plfree = Pt./Prfree; %in watt
Plfreedb = 10*log10(Plfree); %in db

%Ground reference model/2-ray model
%formula Pr = Pt*Gt*Gr*ht*hr/(d^4)

Prray = Pt*Gt*Gr*ht*hr./(d.^4);
Prraydb = 10*log10(Prray);
Plray = Pt./Prray; %in watt
Plraydb = 10*log10(Plray); %in db

%Hata model
%formula Pl = 69.55 + 26.16*log10(fc) - a(hre) - 13.82*log10(hte) + (44.9-6.55*log10(hte))*log10(d/10^(-3))
% a(hre) = 3.2*(log10(11.75)(hre))^2 - 4.97
a_hre = (3.2)*(log10((11.75)*(hr)))^2 - 4.97 ;
Plhatadb = 69.55 + 26.16*log10(fc) - a_hre - 13.82*log10(ht) + (44.9-6.55*log10(ht))*log10(d/10^(-3)) ;
Ptdb = 10*log10(Pt);

Prhatadb = Ptdb./Plhatadb;

figure 1;
plot(d,Prfreedb,"linewidth",1.8);
hold on;
plot(d,Prraydb,"linewidth",1.8);
hold on;
plot(d,Prhatadb,"linewidth",1.8);
xlabel('Distance');
ylabel('Power received in db');
title('Distance vs Power received in db');
legend('Power received in free space model','Power received in 2-ray model','Power received in hata model');


figure 2;
plot(d,Plfreedb,"linewidth",1.8);
hold on;
plot(d,Plraydb,"linewidth",1.8);
hold on;
plot(d,Plhatadb,"linewidth",1.8);
xlabel('Distance');
ylabel('path loss in db');
title('Distance vs Path loss in db');
legend('Path loss in free space model','Path loss in 2-ray model','Path loss in hata model');

f1 = 6000;
f2 = 280;


