image = imread('/home/shothogun/Documents/Projects/UnB/PI/A5/warning-triangle.jpg');

gaussian_filter = get_gaussian_filter(21);

gray_image = rgb2gray(image);
blur_image = conv2(double(gray_image),gaussian_filter);

sobel_1 = [-1,-2,-1;
            0,0,0;
            1,2,1];
           
contour_sharpened_image = uint8(conv2(blur_image, sobel_1));
           
quantized_image = zeros(size(contour_sharpened_image));
quantized_image(contour_sharpened_image > 128) =  255;
quantized_image(258:295, 240:444) = 0;

cropped_image = zeros(size(quantized_image));
cropped_image(50:350, 170:556) = quantized_image(50:350, 170:556);

imshow(cropped_image);

imwrite(cropped_image, 'filtered_image.png');