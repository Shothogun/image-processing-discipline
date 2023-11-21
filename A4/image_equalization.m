pkg load image;

image_path = 'C:\Users\Otho Komatsu\OneDrive\Documentos\PI\gray\equalization_sample_moon.tif';
image = imread(image_path);

mu = 40;
sigma =  30;
x_values = 0:255;

specified_pdf = get_specified_pdf(mu, sigma, x_values);
plot_pdf(x_values, specified_pdf);

p_histogram = get_image_level_histogram(image, 256);
s_equalization_mapping = s_transform(p_histogram, 256);
g = g_transform(specified_pdf, 256);
s_map_to_z = find_s_to_z_map(s_equalization_mapping,g);
new_s_equalization_mapping = map_s_to_g(g, s_map_to_z);
equalized_image = equalize_image(image,new_s_equalization_mapping);

imwrite(equalized_image, "equalized_image.png");

