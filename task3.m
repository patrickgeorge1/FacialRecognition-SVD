function [A_k S] = task3(image, k)
  pkg load image;
  
  image_matrix = double(imread(image)); 
  [m n] = size(image_matrix);
  
    % compute q
    q = [];
    for i = 1:m
      zum = 0;
      for j = 1:n
        zum = zum + image_matrix(i,j);
      endfor
      zum = zum / n;
      q = [q zum];
    endfor
    
    
    
    
    % upgrading the matrix line by substracting q
    for i = 1:m
      for j = 1:n
          image_matrix(i, j) = image_matrix(i, j) - q(i);
       endfor
    endfor
    
    
    % form Z matrix
    Z = [];
    Z = image_matrix' / sqrt(n-1);
  
  
    % compute DVS for Z
    [U, S, V] = svd(Z);
  
  
    % compute W principal arguments
    W = [];
    W = V(:, [1:k]);
    
    
    % compute proiection of A
    Y = [];
    Y = W' * image_matrix;
    
    
    A_k = W * Y;
    for i = 1:m
      for j = 1:n
        A_k(i,j) = A_k(i,j) + q(i);
      endfor
    endfor
    %imshow(uint8(A_k));
    
  
endfunction