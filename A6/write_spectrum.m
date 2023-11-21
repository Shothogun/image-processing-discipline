function write_spectrum(spectrum, filename)
    spectrum_abs = abs(spectrum); % Get absolute values
    spectrum_log = log(1 + spectrum_abs); % Log transform for visualization
    
    % Manual normalization between 0 and 1
    min_val = min(spectrum_log(:));
    max_val = max(spectrum_log(:));
    spectrum_normalized = (spectrum_log - min_val) / (max_val - min_val);
    
    imwrite(spectrum_normalized, filename); % Write grayscale spectrum image
end