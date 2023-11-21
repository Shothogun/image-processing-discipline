pkg load image;

image_path = 'C:\Users\Otho Komatsu\OneDrive\Documentos\PI\gray\barbara_gray.bmp';
image = imread(image_path);

image_dimensions = size(image);

height = image_dimensions(1);
width = image_dimensions(2);

transformed_image = image_geometry_transform(image, @trapezoid_transform, height, width, [double(0.2/height)]);
transformed_image = image_geometry_transform(transformed_image, @rotate_transform, 750, 750, [pi/4]);
transformed_image = image_geometry_transform(transformed_image, @inverse_rotate_transform, 750, 750, [pi/4]);
transformed_image = crop_image(transformed_image, height, width, 102, 149);
transformed_image = image_geometry_transform(transformed_image, @inverse_trapezoid_transform, height, width, [double(0.2/height)]);

error_image = image - transformed_image + 128;

imwrite(transformed_image, "geometry_transformed_image.png");
imwrite(error_image, "error_image.png");
