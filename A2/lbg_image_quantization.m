pkg load image;

image_path = 'C:\Users\Shothogun\OneDrive\Documentos\PI\colored\lena_color_512.tif';
image = imread(image_path);
groups_amount = 16;

sample_image = image(1:16,1:16,:);

[centroids, pixels_group_map] = lbg_algorithm(sample_image, groups_amount);

[rows, cols, dim] = size(sample_image);

for r = 1:rows
  for c = 1:cols
    image(r,c,:) = centroids(:,:,pixels_group_map(r,c));
  end
end

imwrite(image, ['quantized_image.png']);
