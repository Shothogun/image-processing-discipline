pkg load image;

% Carregando a image
original_image = imread('C:\Users\Shothogun\OneDrive\Documentos\PI\lena_gray_256.tif');

levels = [64, 16, 8, 4, 2];
imwrite(original_image, ['lena_gray_256.png']);

for l = levels
##  figure;
  quantized_image = quantize_image(original_image, l);
##  imshow(quantized_image);
  imwrite(quantized_image, ['lena_', num2str(l), 'q.png']);
##  title(['Standard Quantization: ', num2str(l), ' levels']);

##  figure;
  quantized_fs = floyd_steinberg(original_image, l);
##  imshow(quantized_fs);
  imwrite(quantized_fs, ['lena_', num2str(l), 'fs.png']);

##  title(['Floyd Steinberg: ', num2str(l), ' levels']);
end
