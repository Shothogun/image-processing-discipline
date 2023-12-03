pkg load image;

image = imread('/home/shothogun/Documents/Projects/UnB/PI/image-processing-discipline/A7/filtered_image.png');
image = padarray(image,[100,100]);
closed_image = closing_warning_triangle(image);

closed_image = im2bw(closed_image, graythresh(closed_image))*255;
imwrite(closed_image, 'closed_triangle.png');

[image_moments,image_hu_moment] = calculate_moments_and_hu(closed_image);
folder_path =  '/home/shothogun/Documents/Projects/UnB/PI/image-processing-discipline/A7/shapes';
file_pattern = fullfile(folder_path, '*.png'); 

file_list = glob(file_pattern);
 
closest_distance= Inf;
closest_shape = ''; 

for i = 1:length(file_list)
  shape_image = imread(file_list{i});
  shape_image = resize_and_pad(shape_image, size(closed_image));

  if size(shape_image, 3) == 3
    shape_image = rgb2gray(uint8(shape_image));
    shape_image = im2bw(shape_image, graythresh(shape_image))*255;
  end
  
  [~, shape_name, ~] = fileparts(file_list{i});
    
  [~,shape_hu_moment] = calculate_moments_and_hu(shape_image);

  distance = norm(image_hu_moment-shape_hu_moment);
  disp(shape_name);
  disp(distance);
  
  if distance < closest_distance
    closest_distance = distance;
    closest_shape = shape_name;
  endif
end

disp(closest_shape);