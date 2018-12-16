close all; clear all; clc;

%wejscia do sieci oraz minimalne oraz maksymalne wartosci wejsc 
%(25 par 0&1 - osobno dla kazdej z danych uczacych)

start=[0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
     0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
     0 1; 0 1; 0 1; 0 1; 0 1;];   

%ilosc wyjsc z sieci (jedna warstwa - 25 neutronow na wyjsciu)     
wyjscia_s = 25;

%uzycie funkcji newff
net = newff(start, wyjscia_s, {'tansig'}, 'trainlm', 'learnh');


 %kolumnowa reprezentacja binarna 4 emotikonow dla tablicy 8x4
            %:):O:(:| 
WEJSCIE =  [ 0 0 0 0
             0 0 0 0   
             0 0 0 0  
             0 0 0 0
             0 0 0 0
             0 0 0 0
             1 1 1 1 
             0 0 0 0 
             1 1 1 1
             0 0 0 0
             0 0 0 0
             0 0 0 0
             0 0 0 0
             0 0 0 0
             0 0 0 0
             1 0 0 0 
             0 1 1 1
             0 1 1 1 
             0 1 1 1
             1 0 0 0
             0 0 1 0
             1 1 0 0
             1 1 0 0
             1 1 0 0
             0 0 1 0
             ];
%zmienna, ktora reprezentuje, czy uzytkownik "trafil" w wybrana przez
%siebie litere - 1 oznacza trafienie, 0 - chybienie
WYJSCIE = [1 0 0 0 ;  %:)
           0 1 0 0 ;  %:O
           0 0 1 0 ;  %:(
           0 0 0 1 ]; %:|
           
        
%PARAMETRY ALGORYTMU HEBBA
% * wspolczynnik zapominania
lp.dr = 0.5;
% * wspolczynnik uczenia
lp.lr = 0.99;

%dostosowanie parametrów sieci do metody Hebba
wagiHebba = learnh([], WEJSCIE, [], [], WYJSCIE, [], [], [], [], [], lp, []);


%PARAMETRY TRENINGU SIECI:
% * maksymalna ilosc epok
net.trainParam.epochs = 1000;
% * cel wydajnosci sieci
net.trainParam.goal = 0.001;
% * wskaznik uczenia sieci
net.trainParam.lr=0.5;
whebb=wagiHebba';
net = train(net, WEJSCIE, whebb);

%dane testowe 
a_testowe= [0;0;0;0;0;
            0;1;0;1;0; 
            0;0;0;0;0;
            1;0;0;0;1;     
            0;1;1;1;0]; %:)
          
          
b_testowe=[0;0;0;0;0;
           0;1;0;1;0; 
           0;0;0;0;0;
           0;1;1;1;0; 
           0;1;1;1;0;]; %:O
          

          
c_testowe=[0;0;0;0;0;
           0;1;0;1;0; 
           0;0;0;0;0;
           0;1;1;1;0;
           1;0;0;0;1;]; %:(
          
d_testowe=[0;0;0;0;0;
           0;1;0;1;0; 
           0;0;0;0;0;
           0;1;1;1;0;
           0;0;0;0;0;]; %:|
                  
efekt = wagiHebba;
%symulacja sieci net
efekt_1 = sim(net, a_testowe);

%wypisywanie wartosci reguly Hebba, wypisywanie kolejnych wierszy
disp('Jednokrotne wykorzystanie reguly Hebba: ')
disp(':) = '), disp(sum(efekt(1, ':')));
disp(':O = '), disp(sum(efekt(2, ':')));
disp(':( = '), disp(sum(efekt(3, ':')));  
disp(':| = '), disp(sum(efekt(4, ':')));


%wypisywanie wartosci 
disp('Dzialanie algorytmu z wykorzystaniem r. Hebba dla emotikon: ')
disp(':) = '), disp(efekt_1(1)); 
disp(':O = '), disp(efekt_1(2));
disp(':( = '), disp(efekt_1(3)); 
disp(':| = '), disp(efekt_1(4));