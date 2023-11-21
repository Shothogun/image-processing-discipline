function distance = euclidian_3d_distance(x,y)
  distance = sqrt(sum((y - x).^2));
end
