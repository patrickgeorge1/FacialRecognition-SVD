function task2()
  
  image_matrix = double(imread("in/images/image1.gif"));
  [U, S, V] = svd(image_matrix);
  [m n] = size(S);
  
  
  
endfunction
