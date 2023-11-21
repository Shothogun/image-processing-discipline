pkg load image;

% Carregando a image
original_image = imread('C:\Users\Shothogun\OneDrive\Documentos\PI\mandrill_color.tiff');
quantized_image = original_image;

imwrite(quantized_image, 'mandrill_color.png');
[rows, cols, dim] = size(original_image);

levels = [4,2];


for l = levels
##  figure;
  quantized_image(:,:,1) = quantize_image(original_image(:,:,1), l);
  quantized_image(:,:,2)= quantize_image(original_image(:,:,2), l);
  quantized_image(:,:,3) = quantize_image(original_image(:,:,3), l);
  imwrite(quantized_image, ['baboon_q', num2str(l), '.png']);

##  imwrite(quantized_image);
##  title(['Standard Quantization: ', num2str(l), ' levels']);

##  figure;
  quantized_image(:,:,1) = floyd_steinberg(original_image(:,:,1), l);
  quantized_image(:,:,2)= floyd_steinberg(original_image(:,:,2), l);
  quantized_image(:,:,3) = floyd_steinberg(original_image(:,:,3), l);
  imwrite(quantized_image, ['baboon_fs', num2str(l), '.png']);

##  imshow(quantized_image);
##  title(['Floyd Steinberg: ', num2str(l), ' levels']);
end
