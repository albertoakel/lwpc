clear all
close all
clc

for i=0:23
    a=num2str(i)
    A=load([a '.dat'])
    amp(i+1)=A(end,2);
    pha(i+1)=A(end,3);
end

t=[0:23];
pha(1:11)=pha(1:11)-441;
pha(end)=pha(end)-441;
plot(t,pha)