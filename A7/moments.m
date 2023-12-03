function [M00, M10, M01, M20, M02, M11, M30, M03, M12, M21] = moments(image)
    [rows, cols] = size(image);
    [X, Y] = meshgrid(1:cols, 1:rows);
    X = uint64(X);
    Y = uint64(Y);
    image = uint64(image);
    
    M00 = sum(image(:));
    M10 = sum(sum(X .* image));
    M01 = sum(sum(Y .* image));
    M20 = sum(sum(X.^2 .* image));
    M02 = sum(sum(Y.^2 .* image));
    M11 = sum(sum(X .* Y .* image));
    M30 = sum(sum(X.^3 .* image));
    M03 = sum(sum(Y.^3 .* image));
    M12 = sum(sum(X .* Y.^2 .* image));
    M21 = sum(sum(X.^2 .* Y .* image));
end