function [centroids, pixels_group_map] = lbg_algorithm(image, groups_amount)
  image_in_double = double(image(:,:,:));
  centroids = zeros(1,3,groups_amount);
  centroids = initializes_random_centroids(image_in_double, centroids);

  for i = 1:10
    printf("Iteração %d\n", i);
    printf("Grouping...");
    % create groups
    pixels_group_map = group_pixels(image_in_double, groups_amount, centroids);

    printf("Updating centroids...\n");
    % recalculates centroids
    new_centroids = centroids_update(image_in_double, centroids, pixels_group_map);

    % controls convergence
    convergence = 1;
    alpha = 1;

    for i = 1:groups_amount
      if euclidian_3d_distance(new_centroids(:,:,i), centroids(:,:,i)) >= alpha
        convergence = 0;
        break;
      endif
    endfor

    if convergence == 0.1
      printf("converged values at iteration = %d", i);
      break;
     else
      centroids = new_centroids;
    endif
  endfor

  centroids = uint8(centroids);
end
