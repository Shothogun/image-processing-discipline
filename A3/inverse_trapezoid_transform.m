function [rt, ct] = inverse_trapezoid_transform(r,c, params)
  a = params(1);
  height = params(2);
  width = params(3);

  x = c - round(width/2);
  y = r;

  yt = y;
  xt = round(x*(1-a*yt));

  ct = round(xt+ width/2);
  rt = round(yt);
end
