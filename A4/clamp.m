function clamp_value = clamp(value, min, max)
  if value < min
    clamp_value = min;
  else if value > max
    clamp_value = max;
  else
    clamp_value = value;
  endif
end
