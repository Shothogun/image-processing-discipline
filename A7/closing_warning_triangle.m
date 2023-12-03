function closed_image = closing_warning_triangle(image)
  closed_image = image;
  
  se_dil_ball = strel("ball", 82, 82);
  se_dil_diamond = strel("diamond", 120);

  closed_image = imdilate(closed_image, se_dil_ball);
  closed_image = imerode(closed_image, se_dil_diamond);
  
  closed_image(closed_image > 128) =  255;
  closed_image(closed_image < 128) =  0;
  
  closed_image = uint8(closed_image);
end