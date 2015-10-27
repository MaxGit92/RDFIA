function [confusionMatrix, nGoodCat] = multiClassPrediction(predictclassifieurs, imCatTest)
    nbCat = size(imCatTest,1); %nombre de cat�gories
    
    nGoodCat = zeros(1,nbCat);
    confusionMatrix = zeros(nbCat, nbCat);
    
    [predMax, argmax] = max(predictclassifieurs);
    binrange = 1:15; % nombre de cat�gorie pour cr�er matrice de convolution
    debut = 1; % debut de argmax a chaque iteration
    for i=1:nbCat
        argMaxCat = argmax(1,debut:(debut+imCatTest(i)-1));
        confusionMatrix(i,:) = (histc(argMaxCat, binrange)/sum(histc(argMaxCat, binrange))) *100;
        nGoodCat(i) = confusionMatrix(i,i);
        debut = debut + imCatTest(i);
    end

end