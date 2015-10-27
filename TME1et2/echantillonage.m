function []= echantillonage(nomImage,s,delta)
    r=denseSampling(nomImage,s,delta);
    drawRectsImage(nomImage,r,s);
end
