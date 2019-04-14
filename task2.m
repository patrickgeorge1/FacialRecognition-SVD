function task2()
  pkg load image;
  
  image_matrix = double(imread("in/images/image1.gif"));
  [U, S, V] = svd(image_matrix);
  [m n] = size(S);
  
  if (m < n) n = m   % get minumum 
  endif

  X = 1:n;
  sums = 0;
  
  % primul graph
  Y1 = [];
  for i = 1:n
    Y1(i) = S(i,i);
    sums = sums + S(i,i);
  endfor   
  figure(1)
  plot(X,Y1);
  
  
  % al doilea graph
  Y2 = [];
  aux = 0;
  for i = 1:n
    aux = aux + S(i,i);
    to_add = aux / sums;
    Y2 = [Y2 to_add];
  endfor
  figure(2)
  plot(X, Y2);
 
 
 
  % al treilea graph
  Y3 = [];
  for i = 1:n
    A_k = task1("in/images/image1.gif", i);
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
  aux2 = m + n + 1;
  aux2 = aux2 / m;
  aux2 = aux2 / n;
  added = 0;
  for i = 1:n
    added = aux2 * i;
    Y4 = [Y4 added];
  endfor
  figure(4)
  plot(X, Y4);
  
    
    
endfunction
