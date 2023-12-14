pkg load image;

image_path = '/home/shothogun/Documents/Projects/UnB/PI/image-processing-discipline/Images/peppers_color.jpeg';
image = imread(image_path);

red = [255,0,0];
green = [0,255,0];
blue = [0,0,255];
yellow = [255,255,0];
magent = [255,0,255];

color_map = [red;green;blue;yellow;magent];

groups_amount = 5;

sample_image = image(:,:,:);

[centroids, pixels_group_map] = lbg_algorithm(sample_image, groups_amount);

[rows, cols, dim] = size(sample_image);

for r = 1:rows
  for c = 1:cols
    image(r,c,:) = color_map(pixels_group_map(r,c),:);
  end
end

imwrite(image, ['quantized_image.png']);
