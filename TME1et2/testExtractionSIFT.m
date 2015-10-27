% Chargement d'une image
% Image marche
x=80;
y=200;
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
 
% Image aléatoire

%[I,nomim]=randomImage('/users/nfs/Etu4/3101314/M2/RDFIA/TME1et2/Scene/');
[I,nomim]=randomImage('C:\Users\Manence\Desktop\Master 2 DAC\RDFIA\TME1et2\Scene\');
s=16;
delta=8;
[sampling]=denseSampling(I,s,delta); 
[r]=ceil(rand(1)*size(sampling,2));
patch=[sampling(1,r);sampling(1,r)];

 
% Cr�ation des masques de Sobel
% hy*hx=Mx et b*a=My
hy=1/4*[1; 2; 1];
hx=[-1 0 1];
a=transpose(hy);
b=transpose(hx);
 
 
% Calcul du gradient de l'image
[Ix]=convolution_separable(I,hx,hy);
[Iy]=convolution_separable(I,a,b);
Ig=sqrt((Ix.^2)+(Iy.^2));
 
% Calcul de l'orientation du gradient
[Ior]=orientation(Ix,Iy,Ig);
 
% Calcul du masque Gaussien
s=16;
[Mg]=gaussSIFT(s);
 
% Calcul du decripteur SIFT
patchIg=Ig(x:x+16-1, y:y+16-1);
patchIor=Ior(x:x+16-1, y:y+16-1);
seuil=0.8;
[sift]=computeSIFT(s,patchIg,patchIor,Mg);

 
% Visualisation du calcul du descripteur
%patch=[80,173, randi(size(Ig,1))-s ; 200,250,randi(size(Ig,2))-s];
visuSIFT(I,Ig,Ior,patch,nomim,s,sift);
 
%{
figure();
colormap('gray');
imagesc(I);
%}



