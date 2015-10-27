function [values]=trainTest(train, test, y)
    % apprentissage du classifieur svm
    svm = svmtrain(y, train, '-c 200 -t linear');
    [w, b] = getPrimalSVMParameters(svm);
    % On calcul le score des donn�es de test sur le svm appris
    values = test * w + b;
end
