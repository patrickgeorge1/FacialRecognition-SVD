function [m A eigenfaces pr_img] = eigenface_core(database_path)
    
    % read + form T
    dirname = strcat(database_path, "/*.jpg");
    jpgFiles = dir(dirname);
    numFiles = length(jpgFiles);
    mydata = cell(1,numFiles);
    T = [];
    for k = 1:numFiles       
        vect = [];
        
        
        % disp(strcat("dataset/", jpgFiles(k).name))
        denumire_fisier = database_path;
        denumire_fisier = strcat(denumire_fisier, '/');
        denumire_fisier = strcat(denumire_fisier, int2str(k));
        denumire_fisier = strcat(denumire_fisier, ".jpg");
        %image_matrix = double(rgb2gray(imread(strcat("dataset/", jpgFiles(k).name))));
        image_matrix = double(rgb2gray(imread(denumire_fisier)));
        
        
        
        
        vect = matrixToArray (image_matrix);
        T = [T vect];
    endfor
    
    
    
    % compute m 
    [r c] = size(T);
    m = [];
    for i = 1:r
        ssum = 0;
        for j = 1:c
          ssum = ssum + T(i, j);
        endfor
        ssum = ssum / c;
        m = [m ssum];      
    endfor
  
  
  
    % form A
    A = [];
    A = T;
    for i = 1:size(A,1)
        for j = 1:size(A,2)
            A(i, j) = A(i, j) - m(i);  
        endfor   
    endfor

    %compute V and eigenfaces and pr_img
    V = [];
    [Vp Dp] = eig(A' * A);

    
    for i = 1:min(size(Dp, 1), size(Dp, 2))
        if Dp(i, i) > 1
            V = [V Vp(: , i)];
        end

  endfor

    eigenfaces = A * V;
    pr_img = eigenfaces' * A;
    

end