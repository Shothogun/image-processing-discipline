function recovered_image =  recover_image(spectrum, dc_value)
    if nargin < 2
        dc_value = 128; % Default DC value if not specified
    end
    
    % Perform inverse Fourier transform
    recovered_image = ifft2(ifftshift(spectrum));

    % Convert to real values (assuming the original image was real-valued)
    recovered_image = real(recovered_image);

    % Add the DC value to shift all values up by the DC offset
    recovered_image = recovered_image + dc_value;

    % Clip the values to ensure they are within [0, 255]
    recovered_image(recovered_image < 0) = 0;
    recovered_image(recovered_image > 255) = 255;

    % Convert to uint8 for displaying or saving
    recovered_image = uint8(recovered_image);
end