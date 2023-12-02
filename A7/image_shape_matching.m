pkg load image;

image = imread('/home/shothogun/Documents/Projects/UnB/PI/image-processing-discipline/A7/filtered_image.png');
closed_image = dilate_warning_triangle(image);
imwrite(closed_image, 'closed_triangle.png');

imshow(closed_image);