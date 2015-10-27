function [ hmap ] = compute_prediction_heatmap( I, nc, w )
    [ r ] = denseSampling( I, 16, 8 );
    w_star = w(nc)/size(r,2);
    hmap = zeros(size(I));
    for i=1:size(r,2)
        hmap(r(1,i):(r(1,i)+15),r(2,i):(r(2,i)+15)) = w_star(i) + hmap(r(1,i):(r(1,i)+15),r(2,i):(r(2,i)+15));
    end
end