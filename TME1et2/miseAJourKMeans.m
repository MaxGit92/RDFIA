function [newcenters , erreur , movecenters ] = updateKMeans(listPts, centers , nc)
    newcenters=centers
    movecenters=centers
    erreur=0
    for c=1:size(nc,1)
        erreur=sum(distanceGlobale+(listPts(nc==c)-centers)^2)
        moyenne = mean(listPts(nc==c))
        for d=1:size(centers,2)
            newcenters(c,d) = moyenne(d)
        end
        movecenters(c,:)=centers-newcenters
    end
end