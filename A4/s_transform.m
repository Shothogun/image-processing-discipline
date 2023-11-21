function s_equalization_mapping = s_transform(histogram, L)
  s_equalization_mapping = zeros(1,L);
  for k = 1:L
    if k == 1
      s_equalization_mapping(1) = histogram(1);
    else
      s_equalization_mapping(k) = (s_equalization_mapping(k-1)+histogram(k));
    endif
  endfor
  s_equalization_mapping = round(s_equalization_mapping*(L-1));
end

