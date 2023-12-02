function closed_image = dilate_warning_triangle(image)
  closed_image = image;
  
  se_dil_ball = strel("ball", 10,10);
  se_dil_diamond = strel("diamond", 40);
  se_dil_small_diamond = strel("diamond", 5);
  se_er = strel("diamond", 40);

  closed_image = imdilate(closed_image, se_dil_ball);
  closed_image = imdilate(closed_image, se_dil_diamond);
  closed_image = imdilate(closed_image, se_dil_diamond);
  closed_image = imerode(closed_image, se_er);
  closed_image = imerode(closed_image, se_er);
  closed_image = imdilate(closed_image, se_dil_ball);
  closed_image = imerode(closed_image, se_er);
  closed_image = imdilate(closed_image, se_dil_small_diamond);
end