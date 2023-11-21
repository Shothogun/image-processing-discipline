function histogram = get_image_level_histogram(image, L)
  histogram = zeros(1,L);
  [height, width] = size(image);

  for r = 1:height
    for c = 1:width
      histogram(1,image(r,c)+1) += 1;
    endfor
  endfor
  histogram = histogram/(height*width);
end
