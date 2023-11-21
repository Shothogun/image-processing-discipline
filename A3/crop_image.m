function cropped_image = crop_image(image, height, width, x, y)
  cropped_image = zeros(height,width);

  cropped_image = image(y:y+height-1, x:x+width-1);
end
