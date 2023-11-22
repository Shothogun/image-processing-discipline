function recovered_image =  recover_image_with_dc(spectrum, dc_value)
    % Perform inverse Fourier transform
    recovered_image = ifft2(ifftshift(spectrum));

    % Convert to real values (assuming the original image was real-valued)
    recovered_image = real(recovered_image);

    % Normalize to range [0, 255] for displaying or saving
    recovered_image = uint8((recovered_image - min(recovered_image(:))) * (255 / (max(recovered_image(:)) - min(recovered_image(:))))+dc_value);
end
