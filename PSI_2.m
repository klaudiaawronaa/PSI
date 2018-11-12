close all;clear all;clc


%Litera która sprawdza nasza sieæ neuronowa 
A = [0 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1];
 A=A';

B = [1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0];
  B = B';
  
 a_mal=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 1 0 0 1 0 1 0 0 1 0 1 1 1 1 1 ];
 a_mal = a_mal';
%Zbiór naszych ma³ych liter 
a=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 1 0 0 1 0 1 0 0 1 0 1 1 1 1 1 ];
b=[1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0 ];
c=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 ];
d=[0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 1 1 1 1 1 0 0 0 1 1 0 0 0 1 0 1 1 1 1 ];
e=[0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 1 0 0 0 1 1 1 1 1 1 1 0 0 0 0 0 1 1 1 1 ];
f=[0 0 0 0 0 0 1 1 1 0 0 1 0 0 0 1 1 1 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 ];
g=[0 1 1 1 0 0 1 0 1 0 0 1 1 1 1 0 0 0 1 0 0 0 1 1 0 0 1 0 1 0 0 1 1 1 0 ];
h=[1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 ];
i=[0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 ];
j=[0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0 0 ];

male_litery=[a;b;c;d;e;f;g;h;i;j];
male_litery=male_litery';


%Zbiór naszych wielkich liter
wielkie_litery=[0 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1;
    1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0;
    0 1 1 1 0 1 0 0 0 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0 1 1 1 0;
    1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0;
    1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 1;
    1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0;
    0 1 1 1 0 1 0 0 0 1 1 0 0 0 0 1 0 1 1 1 1 0 0 0 1 1 0 0 0 1 0 1 1 1 0;
    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1;
    0 1 1 1 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 1 1 0;
    1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 0 0 0 1 0 1 1 1 0
    a;b;c;d;e;f;g;h;i;j];

wielkie_litery=wielkie_litery';

%Wektor danych wejœciowych 
Wektor_in=[1 ; 1 ; 1; 1; 1; 1; 1; 1; 1; 1;0;0;0;0;0;0;0;0;0;0];
Wektor_in=Wektor_in';

%Tworzenie sieci neuronowej
net2 = newp([0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1], 1);
%Inicjowanie sieci neuronowej
net2 = init(net2);
%Symulacja sieci neuronowej
Siec_litery = sim(net2,wielkie_litery);
%Trening ( uczenie ) sieci neuronowej
net2 = train(net2,wielkie_litery,Wektor_in);
%Ponowna symulacja sieci neuronowej
Siec_litery = sim(net2,wielkie_litery);


%Symulacja sieci z podaniem naszej sprawdzanej litery 
Siec_litery = sim(net2,A);
Siec_litery = Siec_litery';

%Warunek sieci neuronowej: 
if Siec_litery==1 disp('Litera jest duza');
else disp('Litera jest mala'); 
end