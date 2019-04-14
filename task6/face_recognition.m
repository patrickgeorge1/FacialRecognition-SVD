function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  
  image_matrix = double(rgb2gray(imread(image_path)));
  image_vector = matrixToArray (image_matrix);
  
  % compute mean
  ssum = 0;
  for i = 1:size(image_vector)
    ssum = ssum + image_vector(i);
  endfor
  ssum = ssum / size(image_vector, 1);
  
  % compute A
  for i = 1:size(image_vector)
    image_vector(i) = image_vector(i) - ssum;
  endfor
  
  % compute projection
  pr_test_img = eigenfaces' * image_vector;
  
  
  % process image
  index = 1;
  minDist = norm(pr_img(:, 1) - pr_test_img);
  for i = 1:size(pr_img, 1)
      dif = pr_img(:, i) - pr_test_img;
      dis = norm(dif);
      if (dis < minDist)
          minDist = dis;
          index = i;
      endif
  endfor
  min_dist = minDist;
  output_img_index = index;
end