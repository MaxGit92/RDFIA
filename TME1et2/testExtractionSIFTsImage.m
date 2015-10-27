% Chargement d'une image
% Image marche
%{
[I]=marche();
nomim='marche';
patch=[125; 100];
%patch = [125, 125, 0; 100,100,0];
%patch=[97; 121];
%patch=[121; 121];
%}

% Image tools
%{
[I,n,m]=ouvrirImage('/Users/lea/Documents/RDFIA/TME1et2/tools.gif');
patch=[80; 200];
%patch=[173; 250];
%}
dir1='/Users/lea/Documents/RDFIA/TME1et2/Scene/';
dir2='/users/nfs/Etu4/3101314/M2/RDFIA/TME1et2/Scene/';
dir3='C:\Users\Manence\Desktop\Master 2 DAC\RDFIA\TME1et2\Scene\';
% Image al�atoire
[I,nomim]=randomImage(dir3);
s=16;
delta=8;
[r]=denseSampling(I,s,delta);

% Calcul l'ensemble des descripteur d'une image

[sifts]= computeSIFTsImage(I);
drawPatches(I,r,s,sifts);