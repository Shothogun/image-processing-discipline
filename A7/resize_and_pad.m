function resized_img = resize_and_pad(original_img, target_size)
    [original_height, original_width, num_channels] = size(original_img);
    target_height = target_size(1);
    target_width = target_size(2);

    % Compute scale factor
    scale = min(target_width/original_width, target_height/original_height);

    % Resize the image
    resized_img = imresize(original_img, scale);

    % Compute padding
    pad_vertical = target_height - size(resized_img, 1);
    pad_horizontal = target_width - size(resized_img, 2);

    % Apply padding
    resized_img = padarray(resized_img, [floor(pad_vertical/2), floor(pad_horizontal/2)], 'pre');
    resized_img = padarray(resized_img, [ceil(pad_vertical/2), ceil(pad_horizontal/2)], 'post');
end