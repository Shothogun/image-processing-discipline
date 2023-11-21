function recover_image(spectrum, name)
    % Perform inverse Fourier transform
    recovered_image = ifft2(ifftshift(spectrum));

    % Convert to real values (assuming the original image was real-valued)
    recovered_image = real(recovered_image);

    % Normalize to range [0, 255] for displaying or saving
    recovered_image = uint8((recovered_image - min(recovered_image(:))) * (255 / (max(recovered_image(:)) - min(recovered_image(:)))));

    % Display or save the recovered image
    imshow(recovered_image); % Display the recovered image
    imwrite(recovered_image, ['recovered_', name]); % Save the recovered image
end