%[I,n,m]= ouvrirImage('/users/nfs/Etu4/3101314/M2/RDFIA/TME1et2/Scene/bedroom/image_0123.jpg');
%figure();
%colormap('gray');
%imagesc(I); 

%echantillonage(I,16,8);

a = [1,2,3,4;5,6,7,8;9,10,11,12;13,14,15,16];

listPts = [2,2;3,3;2,3;3,2;5,5;6,6;6,5;5,6;8,8;9,9;8,9;9,8];
centers = [2,1;5,4;8,7];
nc=[1;1;1;1;2;2;2;2;3;3;3;3];
[newcenters , erreur , movecenters ] = updateKMeans(listPts, centers , nc);
[newcenters , erreur , movecenters ] = updateKMeans(listPts, newcenters , nc);

erreur
movecenters