function quantized_image = floyd_steinberg(image, levels)
  [rows, cols] = size(image);
  quantized_image = zeros(rows, cols);
  err = zeros(rows, cols);
  step = 255 / (levels - 1);

  for r = 1:rows
    for c = 1:cols
      old_pixel = double(image(r, c)) + double(err(r, c));
      new_pixel = round(old_pixel / step) * step;
      quantized_image(r, c) = new_pixel;
      diff = old_pixel - new_pixel;
      if c + 1 <= cols
        err(r, c + 1) = err(r, c + 1) + diff * 7 / 16;
      end
      if r + 1 <= rows
        if c - 1 >= 1
          err(r + 1, c - 1) = err(r + 1, c - 1) + diff * 3 / 16;
        end
        err(r + 1, c) = err(r + 1, c) + diff * 5 / 16;
        if c + 1 <= cols
          err(r + 1, c + 1) = err(r + 1, c + 1) + diff * 1 / 16;
        end
      end
    end
  end
  quantized_image = uint8(quantized_image);
end

