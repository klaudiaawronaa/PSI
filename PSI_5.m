%%
close all; clear all; clc;
WEJSCIE = iris_dataset; %dane wejsciowe, bezposrednio funkcja matlaba
size(WEJSCIE); %okreslenie rozmiaru tablicy
plot(WEJSCIE(1, :), WEJSCIE(2, :), 'b.', WEJSCIE(3, :),WEJSCIE(4, :), 'g.');
hold on; grid on; %siatka
% PARAMETRY SIECI KOHONENA
dimensions = [10 10]; %wymiar wektora
coverSteps = 100; %liczba krok�w szkoleniowych dla pocz�tkowego pokrycia przestrzeni wej�ciowej
initNeighbor = 3; %pocz�tkowy rozmiar s�siedztwa
topologyFcn = 'hextop'; %funkcja topologii warstw - oblicza pozycje neuronow
distanceFcn = 'dist'; %funkcja odleg�o�ci neuronowej
% TWORZENIE SIECI KOHONENA
net = selforgmap(dimensions, coverSteps, initNeighbor,topologyFcn, distanceFcn); %siec samoorganizujaca
%oparta na topologii
net.trainParam.epochs = 700;% ustalenie maksymalnej liczby epok treningowych utworzonej sieci
% TRENING SIECI
[net, tr] = train(net, WEJSCIE);
y = net(WEJSCIE);
grid on