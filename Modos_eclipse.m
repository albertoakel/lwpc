clear all
close all
clc

unix('./REXP')

break
%All modes
Q=load('npmcas2030_q.dat');
Ec=load('npmcas2030_ec.dat');

%one mode
Q1=load('npmcas2030_q1.dat');
Ec1=load('npmcas2030_ec1.dat');

%beta variation all modes anda one modes
ECB=load('npmcas2030_ec_beta.dat');
ECB1=load('npmcas2030_ec_beta1.dat');

d=Q(1:end-1,1);
f=669.5
q=Q(1:end-1,3)
ec=Ec(1:end-1,3)

q1=Q1(1:end-1,3)
ec1=Ec1(1:end-1,3)


 ecb=ECB(1:end-1,3)
 ecb1=ECB1(1:end-1,3)


 %plot(d,ecb,'.-');hold on
 %plot(d,ecb1,'.-r')
 
%  subplot(1,2,1)
%  plot(d,q,'.-');hold on
%  plot(d,ec,'.-r')
%  axis square
% %  
%  %subplot(1,2,2)
% plot(d,q1,'.-');hold on
%   plot(d,ec1,'.-r')
 
%  
 dd=abs(q-ec)
 dd1=abs(q1-ec1)


plot(d,dd,'.-'),hold on
plot(d,dd1,'.-r')
%plot(d,dd3,'.-m')
title('NPM-CAS 11/07/2010 20:30 UT')
xlabel('Distance [km]','fontsize',12)
ylabel('||\phi_1 -\phi_{all} || [degree]','fontsize',12)
axis square
legend('lwpc all modes','lwpc  one mode')

figure
plot(d,q,'-r'),hold on
plot(d,q1,'--r')
plot(d,ec,'-b')
plot(d,ec1,'--b')
title('NPM-CAS 11/07/2010 20:30 UT')
xlabel('Distance [km]','fontsize',12)
ylabel('||\phi_1 -\phi_{all} || [degree]','fontsize',12)
axis square
legend('lwpc all modes quiescent','lwpc  one mode quiescent','lwpc all modes eclipse','lwpc one mode eclipse')


figure('name','amplitude')
plot(d,q,'-g'),hold on
plot(d,q1,'--g')
plot(d,ecb,'-r')
plot(d,ecb1,'--r')
plot(d,ec,'-b')
plot(d,ec1,'--b')
legend('lwpc all modes quiescent','lwpc  one mode quiescent','lwpc all modes eclipse beta','lwpc  one mode eclipse beta','lwpc all mode eclipse','lwpc one mode eclipse')

