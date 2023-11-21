function [rt,ct] = rotate_transform(r,c, params)
  theta = params(1);
  height = params(2);
  width = params(3);

  x = c-175;
  y = r+60;

  yt = -x*sin(theta) + y*cos(theta);
  xt = x*cos(theta) + y*sin(theta);

  ct = round(xt)-175;
  rt = round(yt)+60;
end
