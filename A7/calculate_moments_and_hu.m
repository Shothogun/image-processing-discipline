function [moments_struct, hu_moments] = calculate_moments_and_hu(image)
    % Ensure image is binary
    if numel(unique(image)) > 2
        error('Image must be binary.');
    end
    
    [m00, m10, m01, m20, m02, m11, m30, m03, m12, m21] = moments(image);
    
    % Central moments
    x_bar = m10 / m00;
    y_bar = m01 / m00;
    mu20 = m20 - x_bar * m10;
    mu02 = m02 - y_bar * m01;
    mu11 = m11 - x_bar * m01;
    mu30 = m30 - 3 * x_bar * m20 + 2 * x_bar^3 * m00;
    mu03 = m03 - 3 * y_bar * m02 + 2 * y_bar^3 * m00;
    mu12 = m12 - 2 * y_bar * m11 - x_bar * m02 + 2 * y_bar^2 * m10;
    mu21 = m21 - 2 * x_bar * m11 - y_bar * m20 + 2 * x_bar^2 * m01;
    
    % Normalized central moments
    nu20 = mu20 / m00^2;
    nu02 = mu02 / m00^2;
    nu11 = mu11 / m00^2;
    nu30 = mu30 / m00^2.5;
    nu03 = mu03 / m00^2.5;
    nu12 = mu12 / m00^2.5;
    nu21 = mu21 / m00^2.5;
    
    % Create a structure similar to OpenCV's moments
    moments_struct = struct('m00', m00, 'm10', m10, 'm01', m01, 'm20', m20, 'm02', m02, 
                            'm11', m11, 'm30', m30, 'm03', m03, 'm12', m12, 'm21', m21, 
                            'mu20', mu20, 'mu02', mu02, 'mu11', mu11, 'mu30', mu30, 
                            'mu03', mu03, 'mu12', mu12, 'mu21', mu21, 
                            'nu20', nu20, 'nu02', nu02, 'nu11', nu11, 'nu30', nu30, 
                            'nu03', nu03, 'nu12', nu12, 'nu21', nu21);
    
    % Hu moment invariants
    hu_moments = zeros(1, 7);
    hu_moments(1) = nu20 + nu02;
    hu_moments(2) = (nu20 - nu02)^2 + 4 * nu11^2;
    hu_moments(3) = (nu30 - 3 * nu12)^2 + (3 * nu21 - nu03)^2;
    hu_moments(4) = (nu30 + nu12)^2 + (nu21 + nu03)^2;
    hu_moments(5) = (nu30 - 3*nu12) * (nu30 + nu12) * ((nu30 + nu12)^2 - 3*(nu21 + nu03)^2) + (3*nu21 - nu03) * (nu21 + nu03) * (3*(nu30 + nu12)^2 - (nu21 + nu03)^2);
    hu_moments(6) = (nu20 - nu02) * ((nu30 + nu12)^2 - (nu21 + nu03)^2) + 4*nu11*(nu30 + nu12)*(nu21 + nu03);
    hu_moments(7) = (3*nu21 - nu03) * (nu30 + nu12) * ((nu30 + nu12)^2 - 3*(nu21 + nu03)^2) - (nu30 - 3*nu12) * (nu21 + nu03) * (3*(nu30 + nu12)^2 - (nu21 + nu03)^2);
end
