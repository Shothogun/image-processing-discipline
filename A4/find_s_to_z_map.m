function s_map_to_z = find_s_to_z_map(s,g)
  s_size = size(s);
  g_size = size(g);
  s_map_to_z = zeros(s_size);

  for k = 1:s_size(2)
    [~, z]= min(abs(g-s(1,k)));
    s_map_to_z(1,k) = z;
  endfor
end
