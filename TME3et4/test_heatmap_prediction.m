% Tous les paths necessaires

pathBow='C:\Users\Maxence\Documents\M2\RDFIA\TME3et4\Bows\';% la ou on a sauvegarder les bows
pathIm='C:\Users\Maxence\Documents\M2\RDFIA\TME1et2\Scene\';
pathClassifier='C:\Users\Maxence\Documents\M2\RDFIA\TME3et4\Classifiers\'
pathDes='C:\Users\Maxence\Documents\M2\RDFIA\TME1et2\Sifts\'
%patchmin='/users/nfs/Etu4/3101314/M2/RDFIA/TME3et4/patchmin';
%nomDico='/users/nfs/Etu4/3101314/M2/RDFIA/TME1et2/Descripteurs/dictionnaireVisuel';
patchmin='C:\Users\Maxence\Documents\M2\RDFIA\TME3et4\patchmin';
nomDico='C:\Users\Maxence\Documents\M2\RDFIA\TME1et2\Descripteurs\dictionnaireVisuel';


%definition des paramètres d'apprentissage
nTrain = 100;
K = 1000;
catinit=1;
catend=15;

% Recuperation du nb d'images pour chaque catégorie
[imCat,imCatTest]=NbImCatAllTest(pathBow, nTrain);

% chargement des données de train et de test
[ train , test , ras ] = loadData2( nTrain , imCat , pathBow, K);

%predictclassifieurs = zeros(catend, size(test,1));
%{
% Entrainement des classifieurs pour chaque catégorie
for index=catinit:catend
    [y, ytest]=labelsTrainTest(nTrain,size(test,1),imCat,index);
    [values, w, b] = trainTest2(train, test, y);
    %predictclassifieurs(index,:) = values;
    save(strcat(pathClassifier,'classifier_',num2str(index),'_w.mat'),'w');
    save(strcat(pathClassifier,'classifier_',num2str(index),'_b.mat'),'b');
end
%}
%chargement du dictionnaire visuel et du matchmin
load(nomDico);
load(patchmin);

% Chargement d'une image aléatoire
[ I, nomim, sifts, index] = randomImageDes2( pathIm, pathDes );

% Calcul du bow pour l'image chargée aléatoirement
matNormClusters=sum(bestCentres.^2,2);
[bow, nc] = computeBow( sifts, bestCentres, matNormClusters );

% Chargement du classifier de la catégorie correspondant à l'image
load(strcat(pathClassifier,'classifier_',num2str(index),'_w'));
[ hmap ] = compute_prediction_heatmap( I, nc, w );

visuHeatMap( I , nc, w, hmap, patchmin, nomim);

