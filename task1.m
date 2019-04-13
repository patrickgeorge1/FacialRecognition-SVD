function A_k = task1 (image, k)
    pkg load image;

    % image_matrix = double(rgb2gray(imread(image)));
    image_matrix = double(imread(image));
    [U, S, V] = svd(image_matrix);
    [mu nu] = size(U);
    [mv nv] = size(V);
    [ms ns] = size(S);
    Vt = transpose(V);
    
    U = U(1:mu, 1:k);
    S = S(1:k, 1:k);
    Vt = Vt(1:k, 1:nv);
    
    
    
    A_k = U * S * Vt;
    % imshow(uint8(A_k));
endfunction
