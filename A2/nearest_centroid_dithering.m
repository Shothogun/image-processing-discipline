function [centroid_index, image_in_double]= nearest_centroid_dithering(image_in_double, reference_vector, centroids,r,c)
  [~, ~, groups_amount] = size(centroids);
  nearest_distance = Inf;
  centroid_index = -1;

  centroids = double(centroids);
  [height, width, ~] = size(image_in_double);

  distances = squeeze(euclidian_3d_distance(reference_vector, centroids));

  for i = 1:groups_amount
    distance = distances(i,1);

    if distance < nearest_distance
      nearest_distance = distance;
      centroid_index = i;
    end
  endfor

  new_pixel_value = centroids(:,:,centroid_index);
  diff = new_pixel_value - squeeze(image_in_double(r,c,:))';
  diff = reshape(diff,1,1,3);

  if c + 1 <= width
    image_in_double(r, c + 1,:) += diff * 7 / 16;
  end
  if r + 1 <= height
    if c - 1 >= 1
      image_in_double(r + 1, c - 1,:) += diff * 3 / 16;
    end
    image_in_double(r + 1, c,:) += diff * 5 / 16;
    if c + 1 <= width
      image_in_double(r + 1, c + 1,:) += diff * 1 / 16;
    end
  end
end

