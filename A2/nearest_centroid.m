function centroid_index = nearest_centroid(reference_vector, centroids)
  [~, ~, groups_amount] = size(centroids);
  nearest_distance = Inf;
  centroid_index = -1;

  distances = squeeze(euclidian_3d_distance(reference_vector, centroids));

  for i = 1:groups_amount
    distance = distances(i,1);
    if distance < nearest_distance
      nearest_distance = distance;
      centroid_index = i;
    end
  endfor
end

