function new_centroids = centroids_update(image_in_double, centroids, pixels_group_map)
  [height, width, ~] = size(image_in_double);
  centroids_dimentions = size(centroids);
  n_groups = centroids_dimentions(3);

  new_centroids = zeros(centroids_dimentions);
  groups_pixels_amount = zeros(1,n_groups);

  for r = 1:height
    for c = 1:width
      group_index = pixels_group_map(r,c);
      new_centroids(:,:,group_index) += squeeze(image_in_double(r,c,:))';
      groups_pixels_amount(1,group_index) += 1;
    endfor
  endfor

  for i = 1:n_groups
    if groups_pixels_amount(1,i) != 0
      new_centroids(:,:,i) /= groups_pixels_amount(1,i);
    else
      min_heigth_value = 1;
      max_heigth_value = height;

      min_width_value = 1;
      max_width_value = width;

      random_row = int8(get_random_value(min_heigth_value, max_heigth_value));
      random_col = int8(get_random_value(min_width_value, max_width_value));
      new_centroids(:,:,i) = squeeze(image_in_double(random_row, random_col, :))';
    endif
  endfor
end

