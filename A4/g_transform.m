function g_equalization_mapping = g_transform(specified_histogram, L)
  g_equalization_mapping = zeros(1,L);
  for k = 1:L
    if k == 1
      g_equalization_mapping(1) = specified_histogram(1);
    else
      g_equalization_mapping(k) = (g_equalization_mapping(k-1)+specified_histogram(k));
    endif
  endfor
  g_equalization_mapping = round(g_equalization_mapping*(L-1));
end

