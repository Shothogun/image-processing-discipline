function initialized_centroids = initializes_random_centroids(image_in_double, centroids);
  [height, width, ~] = size(image_in_double);
  [~,~,groups_amount] = size(centroids);

  initialized_centroids = zeros(size(centroids));

  min_heigth_value = 1;
  max_heigth_value = height;

  min_width_value = 1;
  max_width_value = width;

   for i = 1:groups_amount
     random_row = int8(get_random_value(min_heigth_value, max_heigth_value));
     random_col = int8(get_random_value(min_width_value, max_width_value));
     initialized_centroids(:,:,i) = squeeze(image_in_double(random_row, random_col, :))';
   endfor
end

