function gaussian_filter = get_gaussian_filter(filter_size)
   % Standard deviation for the Gaussian
  sigma = 1.0;

  % Create a meshgrid for the filter
  [x, y] = meshgrid(-(filter_size-1)/2:(filter_size-1)/2, -(filter_size-1)/2:(filter_size-1)/2);

  % Generate the Gaussian filter using the 2D Gaussian function
  gaussian_filter = exp(-(x.^2 + y.^2) / (2*sigma^2));
  gaussian_filter = gaussian_filter / sum(gaussian_filter(:)); % Normalize the filter to sum to 1