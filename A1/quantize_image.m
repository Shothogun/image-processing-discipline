function quantized_image = quantize_image(image, levels)
    quantized_image = image;
    % Convert the image to double data type for processing
    quantized_image = double(quantized_image);

    % Calculate step size
    step = 255 / (levels - 1);

    % Quantize the image
    quantized_image = round(quantized_image / step) * step;

    % Convert the quantized image back to uint8
    quantized_image = uint8(quantized_image);
end
