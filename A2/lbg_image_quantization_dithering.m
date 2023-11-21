pkg load image;

image_path = 'C:\Users\Otho Komatsu\OneDrive\Documentos\PI\colored\lena_color_512.tif';
image = imread(image_path);
groups_amount = 256;

sample_image = image(1:16,1:16,:);

[centroids, ~] = lbg_algorithm(image, groups_amount);

[rows, cols, dim] = size(image);

image_in_double = double(image);

printf("Dithering...\n");
for r = 1:rows
  for c = 1:cols
    [centroid_index, image_in_double] = nearest_centroid_dithering(image_in_double, squeeze(image_in_double(r,c,:))', centroids, r, c);
    image(r,c,:) = centroids(:,:,centroid_index);
  end
  printf("Row: %d\n", r);
end

imwrite(image, ['quantized_image_ditheting.png']);

