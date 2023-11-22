function recover_image(spectrum, name, path)
    % Perform inverse Fourier transform
    recovered_image = ifft2(ifftshift(spectrum));

    % Convert to real values (assuming the original image was real-valued)
    recovered_image = real(recovered_image);

    % Normalize to range [0, 255] for displaying or saving
    recovered_image = uint8((recovered_image - min(recovered_image(:))) * (255 / (max(recovered_image(:)) - min(recovered_image(:)))));

    % Display or save the recovered image
    imwrite(recovered_image, [path, 'recovered_', name]); % Save the recovered image

    if strfind(name, 'hp')
      recovered_image = recovered_image + 128;
      imwrite(recovered_image, [path, 'recovered_dc_added', name]); % Save the recovered image
    endif
end
