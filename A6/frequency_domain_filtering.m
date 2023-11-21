path = '/home/shothogun/Documents/Projects/UnB/PI/Images/';
image_names = {'lena_gray_512.png', 'peppers.png'};
image_paths = cell(length(image_names), 1); % Initialize cell array to store paths

for i = 1:length(image_names)
    image_paths{i} = [path, strtrim(image_names{i})]; % Store paths in cell array
end

for i = 1:length(image_paths)
    [~, name, ext] = fileparts(image_names{i});
    input_image = imread(strtrim(image_paths{i}));
    
    spectrum = fft2(input_image);
    spectrum_shifted = fftshift(spectrum); % Shift zero frequency to center

    write_spectrum(spectrum, ['spectrum_', name, '.png']);    
    write_spectrum(spectrum_shifted, ['spectrum_shifted_', name, '.png']);
    
    filter = imread('/home/shothogun/Documents/Projects/UnB/PI/A6/filters/sample.png');
    spectrum_shifted = spectrum_shifted.*filter;   
    
    recover_image(spectrum_shifted, ['filtered_', name, '.png']);
end
