function [rt,ct] = inverse_rotate_transform(r,c, params)
  theta = params(1);
  height = params(2);
  width = params(3);

  x = c - round(width/2);
  y = r - round(height/2);

  yt = x*sin(theta) + y*cos(theta);
  xt = x*cos(theta) - y*sin(theta);

  ct = round(xt + round(width/2));
  rt = round(yt+ round(height/2));
end
