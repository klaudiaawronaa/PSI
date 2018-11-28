close all; clear all; clc;

wej_in = [-2 -1.6 -1.2 -0.8 -0.4 0 0.4 0.8 1.2 1.6 2];
wej_out = [1.6633e+03 1.6880e+03 1.6867e+03 1.7764e+03 1.7800e+03 0.0 1.9495e+03 1.9825e+03 2.1477e+03 2.1791e+03 2.3262e+03];

testowe = zeros(1);

net = feedforwardnet(3); %tworzenie sieci z 2 warstwami ukrytymi
net.trainFcn = 'traingd'; %algorytm wstecznej propagacji
net.trainParam.lr = 0.5; %wsp. uczenia
net.trainParam.mc = 0.5; %bezwladnosc
net = train(net, wej_in, wej_out);
efekty = zeros(size(net));

for i = 1:11
    testowe(i) = RastrignTest3D(wej_in(i)); %wygenerowanie prawid³owych wyników dzia³ania funkcji RastrignTest3D
    efekty(i) = sim(net, wej_in(i)); %test dzia³ania sieci
end  