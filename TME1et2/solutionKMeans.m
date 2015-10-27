function [centres,erreur]=solutionKMeans(points, M)
    squarenormExamples=0 %on ne l'utilise pas dans la fonction assignementKMeans c'est juste une valeur par default
    % S�l�ction al�atoire des M points parmi les points initiaux.
    [centres]=randomSeed(points, M);
    [nc]=assignementKMeans(points, centres, squarenormExamples);
    [centres, erreur, movecentres]=updateKMeans(points, centres, nc);
    erreurTmp=10;
    epsilon=0.01;
    % Tant que les centres ne sont pas stables.
    while (abs(erreur - erreurTmp)>epsilon)
        [nc]=assignementKMeans(points, centres, squarenormExamples);%def squarenormExamples
        erreurTmp=erreur;
        [centres, erreur, movecentres]=updateKMeans(points, centres, nc);
    end

end

