function equalized_image = equalize_image(image,new_s_equalization_mapping)
  [height, width]= size(image);
   equalized_image = zeros(height,width);

  for i = 1:height
    for j = 1:width
      % Images pixels values ranges 0-255
      % However, the index ranges 1-256
      equalized_image(i,j) = new_s_equalization_mapping(image(i,j)+1);
    endfor
  endfor
  equalized_image = uint8(equalized_image);
end

