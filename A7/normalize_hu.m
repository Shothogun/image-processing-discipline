function normalized_hu_value = normalize_hu(value)
  eps = 0.01;
  normalized_hu_value = -sign(value) .* log10(abs(value)+eps)
end'