function new_s_equalization_mapping = map_s_to_g(g, s_map_to_z)
  [~,s_size] = size(s_map_to_z);

  new_s_equalization_mapping = zeros(1,s_size);
  for i = 1:s_size
    new_s_equalization_mapping(1,i) = g(1, s_map_to_z(1,i));
  endfor
end

