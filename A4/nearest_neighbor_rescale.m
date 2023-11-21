pkg load image;

image_path = 'C:\Users\Otho Komatsu\OneDrive\Documentos\PI\gray\barbara.png';
image = imread(image_path);

scale = 0.3;

[height, width] = size(image);

new_height = round(scale * height);
new_width = round(scale * width);

rescaled_image = zeros(new_height, new_width);

for i = 1:new_height
  for j = 1:new_width
    original_image_x = round(j / scale);
    original_image_y = round(i / scale);

    original_image_x = max(min(original_image_x, width), 1);
    original_image_y = max(min(original_image_y, height), 1);

    rescaled_image(i, j) = image(original_image_y, original_image_x);
  endfor
endfor

rescaled_image = uint8(rescaled_image);

imwrite(rescaled_image, "rescaled_image.png");

