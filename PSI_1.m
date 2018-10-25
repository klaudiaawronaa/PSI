
close all; clear all; clc;

net=newp([0 1; -2 2],1); %tworzy perceptron sk³adajacy sie z 2 elementow
%gdzie pierwszy w zakresie (0,1), drugi(-2,2) i jeden neuron.

W=[0 0 1 1; 0 1 0 1];
T=[0 0 0 1]; 

net=init(net); 
%inicjalizacja dowolnymi parametrami

sym_przed=sim(net,W)
%SiMULiNK - symulacja 
% pierwszy argument to model
% a drugi parametry

net.trainParam.epochs=10; 
%maximum epok to 20
net=train(net,W,T);
sym_po = sim(net,W)


