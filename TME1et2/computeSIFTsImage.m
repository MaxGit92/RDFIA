function [sifts]= computeSIFTsImage(I) %%% Calcule du descripteur SIFT pour un patch de taille s
    % Cr�ation des masques de Sobel
    % hy*hx=Mx et b*a=My
    hy=1/4*[1; 2; 1];
    hx=[-1 0 1];
    a=transpose(hy);
    b=transpose(hx);

    % Calcul de Ig
    [Ix]=convolution_separable(I,hx,hy);
    [Iy]=convolution_separable(I,a,b);
    Ig=sqrt(Ix.*Ix + Iy.*Iy);

    % Calcul de Ior
    [Ior]=orientation(Ix,Iy,Ig);
    
    % Calcul du masque Gaussien
    s=16;
    [Mg]=gaussSIFT(s);
    
    % Extraction des patchs et calcul des descripteurs pour chaque patch
    delta=8;
    [r]=denseSampling(I,s,delta); 
    sifts=zeros(128,size(r,2));
    for i=1:size(r,2)
        %patch = [r(1,i); r(2,i)];
        %subIg = Ig(patch(1,1):patch(1,1)+s-1,patch(2,1):patch(2,1)+s-1);
        %subIor = Ior(patch(1,1):patch(1,1)+s-1,patch(2,1):patch(2,1)+s-1);
        x = r(1,i);
        y = r(2,i);
        patchIg=Ig(x:x+16-1,y:y+16-1);
        patchIor=Ior(x:x+16-1,y:y+16-1);
        sift = computeSIFT(s, patchIg, patchIor, Mg);
        sifts(:,i) = sift;
    end
    
    %drawPatches(I, r, s, sifts);
end