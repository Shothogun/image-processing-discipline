function [transformed_image] = image_geometry_transform(image, function_transform, new_height, new_width, params)
  if nargin < 5
      params = [];
  end

  transformed_image = zeros(new_height, new_width);
  [height, width] = size(image);

  for r = 1:new_height
    for c = 1:new_width
      [rt,ct] = function_transform(r, c, [params, new_height, new_width]);

      if (ct < 1) || (ct > width) || (rt < 1) || (rt > height)
        transformed_image(r,c) = 0;
      else
        transformed_image(r,c) = image(rt,ct);
      end
    endfor
  endfor

  transformed_image = uint8(transformed_image);
end
