function [sift]=computeSIFT(s,Ig,Ior,Mg) %%% Calcule du descripteur SIFT pour un patch de taille s 
    sift=zeros(128,1);
    p=1;
    seuil=0.2; %%% DÃ©finition du seuil

    for i=1:4:s %% Pour construire
        for j=1:4:s %% les sous matrices de Ior, Mg et Ig
            matIor=Ior([i:i+3],[j:j+3]);
            matIg=Ig([i:i+3],[j:j+3]);
            matMg=Mg([i:i+3],[j:j+3]);
            histo=zeros(1,8);
            for a=1:size(matIor,1) % Pour calculer
                for b=1:size(matIor,2) % l'histogramme d'un bloc
                    if(matIor(a,b) > 0)
                        histo(matIor(a,b))=histo(matIor(a,b))+ matIg(a,b)*matMg(a,b);
                    end    
                end
            end
            %histo=histo(2:9);
            % Construction du vecteur sift par concatenation des histo
            for k=1:8
                sift(p)=histo(k);
                p=p+1;
            end
        end
    end
    if(norm(sift) < seuil) % pour ne pas considérer les zones est uniformes
        sift=zeros(128,1);
    else
        sift=sift/norm(sift);
        sift(sift(:) > seuil)=seuil;
        sift=sift/norm(sift);
    end
    
 
end

