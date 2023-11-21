path = '/home/shothogun/Documents/Projects/UnB/PI/image-processing-discipline/Images/';
image_names = {'lena_gray_512.png', 'peppers.png'};
image_paths = cell(length(image_names), 1); % Initialize cell array to store paths

folder_path = '/home/shothogun/Documents/Projects/UnB/PI/image-processing-discipline/A6/filters/';
output_path = '/home/shothogun/Documents/Projects/UnB/PI/image-processing-discipline/A6/Output/';
file_pattern = fullfile(folder_path, '*.png'); % Change '*.png' to match your desired file type or pattern

file_list = glob(file_pattern);

for i = 1:length(image_names)
    image_paths{i} = [path, strtrim(image_names{i})]; % Store paths in cell array
end

for i = 1:length(image_paths)
    [~, name, ext] = fileparts(image_names{i});
    input_image = imread(strtrim(image_paths{i}));
    
    spectrum = fft2(input_image);
    spectrum_shifted = fftshift(spectrum); % Shift zero frequency to center

    write_spectrum(spectrum, [output_path, 'spectrum_', name, '.png']);    
    write_spectrum(spectrum_shifted, [output_path, 'spectrum_shifted_', name, '.png']);
    
    
    for j = 1:length(file_list)
      [~, filter_name, ~] = fileparts(file_list{j});
      
      filter = imread(file_list{j});
      
      spectrum_filtered = spectrum_shifted.*filter;
      
      write_spectrum(spectrum_filtered, ['filtered_spectrum_', name, '_', filter_name, '.png'], output_path); 

      recover_image(spectrum_filtered, ['filtered_', name, '_', filter_name, '.png'], output_path);
    endfor
end