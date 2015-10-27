% S�l�ction al�atoire des descripteurs SIFT
%pathDes='/Users/lea/Documents/RDFIA/TME1et2/Scene'; % A verifier pour le path
%addpath('C:\Users\Manence\Desktop\Master 2 DAC\RDFIA\TME1et2\codesTME1-2\k-means')
%pathDes='C:\Users\Manence\Desktop\Master 2 DAC\RDFIA\TME1et2\'; % A verifier pour le path
addpath('/users/nfs/Etu4/3101314/M2/RDFIA/TME1et2/codesTME1-2/k-means/')
pathDes='/users/nfs/Etu4/3101314/M2/RDFIA/TME1et2/Sifts/';
pathSav='/users/nfs/Etu4/3101314/M2/RDFIA/TME1et2/KMeans/';

[points,normes]=randomSampling(pathDes);
% Lancement de SolutionKM
M=1000;
[centres,erreur]=solutionKMeans(points, M);
minErreur=erreur;
T=50; 
for t=1:T
    [centres,erreur]=solutionKMeans(points, M);
    if erreur<minErreur
        minErreur=erreur;
        bestCentres=centres;
    end
end
%Sauvegarde du dictionnaire
save(strcat(pathSav,'dictionnaireVisuel.m'),'bestCentres')