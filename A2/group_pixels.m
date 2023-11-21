function pixels_group_map = group_pixels(image_in_double, groups_amount, centroids)
  [height, width, ~] = size(image_in_double);
  pixels_group_map = zeros(height, width);

  for r = 1:height
    for c = 1:width
      pixels_group_map(r,c) = nearest_centroid(squeeze(image_in_double(r,c,:))', centroids);
    endfor
  endfor
end

