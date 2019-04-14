function task5()
  pkg load image;
  
  image_matrix = double(imread("in/images/image1.gif")); 
  [m n] = size(image_matrix);

   
    
    q = [];
    for i = 1:m
      zum = 0;
      for j = 1:n
        zum = zum + image_matrix(i,j);
      endfor
      zum = zum / n;
      q = [q zum];
    endfor
    
    for i = 1:m
      for j = 1:n
          image_matrix(i, j) = image_matrix(i, j) - q(i);
       endfor
    endfor
    
     Z = [];
     Z = image_matrix' / sqrt(n-1);
     [U, S, V] = svd(Z);
     ssum = 0;
     [m1 n1] = size(S);
     if (m1 < n1)
       n1 = m1;
     endif
     for i = 1:n
       ssum = ssum + S(i,i);
     endfor
   
   % primul graph
   plot(diag(S));
  
  
   % al doilea graph
    aux = 0;
    X = 1:n1;
    Y2 = [];
    for i = 1:n1
      aux = aux + S(i, i);
      Y2 = [Y2 aux/ssum];
    endfor
    figure(2);
    plot(X, Y2);
  
   
    % al treilea graph
    Y3 = [];
    for i = 1:n
      A_k = task3("in/images/image1.gif", i);
      Sum_matrix = A_k - image_matrix;
      Squared_matrix = Sum_matrix.^2;
      
      suma = 0;
      for ii=1:size(Squared_matrix,1)
        for jj=1:size(Squared_matrix,2)
          suma = suma + Squared_matrix(ii,jj);
        endfor
      endfor
      
      suma = suma / n;
      suma = suma / m;
      Y3 = [Y3 suma];
    endfor 
    figure(3)
    plot(X,Y3); 
   
   % al patrulea graph
   Y4 = [];
   for i = 1:n
     ae = 2 * i + 1;
     ae = ae / n;
     Y4 = [Y4 ae];
   endfor
  figure(4);
  plot(X, Y4);  
   
   
end