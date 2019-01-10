%kolumnowa reprezentacja binarna pierwszych 20 duzych liter alfabetu dla tablicy 4x5
%dane wejsciowe:
%A B C D E F G H I J K L M N O P R S T U
WEJSCIE = [0 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 0 1 1;
1 1 1 1 1 1 1 0 1 1 0 0 0 0 1 1 1 1 1 0;
1 1 1 1 1 1 1 0 1 1 0 0 0 0 1 1 1 1 1 0;
0 0 0 0 1 1 0 1 0 1 1 0 1 1 0 0 0 0 0 1;
1 1 1 1 1 1 1 1 0 0 1 1 1 1 1 1 1 1 0 1;
0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 1 0;
0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0;
1 1 1 1 0 0 0 1 0 1 0 0 1 1 1 1 1 0 0 1;
1 1 1 1 1 1 1 1 0 0 1 1 1 1 1 1 1 0 0 1;
1 1 0 0 1 1 0 1 1 0 1 0 0 1 0 1 1 1 1 0;
1 1 0 0 1 1 1 1 0 0 0 0 1 0 0 1 1 1 0 0;
1 0 0 1 0 0 1 1 0 1 0 0 1 1 1 0 0 0 0 1;
1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 0 0 1;
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0;
0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 0 0;
1 1 1 1 0 0 1 1 0 1 0 0 1 1 1 0 0 1 0 1;
1 1 0 1 1 1 0 1 1 0 1 1 1 1 0 1 1 0 0 0;
0 1 1 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 1 1;
0 1 1 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1;
1 0 0 0 1 0 0 1 0 1 1 1 1 1 0 0 1 0 0 0];
% PARAMETRY SIECI KOHONENA
dimensions = [4 5]; %wymiar wektora
coverSteps = 100; %liczba kroków szkoleniowych dla pocz¹tkowego pokrycia przestrzeni wejœciowej
initNeighbor = 1; %pocz¹tkowy rozmiar s¹siedztwa
topologyFcn = 'gridtop'; %funkcja topologii warstw
distanceFcn = 'dist'; %funkcja odleg³oœci neuronowej
% TWORZENIE SIECI KOHONENA (SOM)
net = selforgmap(dimensions, coverSteps, initNeighbor,topologyFcn, distanceFcn);
net.trainParam.epochs = 1500; %ustalenie maksymalnej liczby epok treningowych utworzonej sieci
% TRENING SIECI
[net, tr] = train(net, WEJSCIE);%uczenie sieci
y = net(WEJSCIE); %przypisanie sieci do wyjœcia Y
classes = vec2ind(y); %konwertowanie wektorów uczonej sieci na indeksy