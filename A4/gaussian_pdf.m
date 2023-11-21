function pdf_values = gaussian_pdf(mean, sigma, x_values)
  % The Gaussian PDF formula applied over x_values
  coefficient = 1 / (sigma * sqrt(2 * pi));
  exponent = -((x_values - mean).^2) / (2 * sigma^2);
  pdf_values = coefficient * exp(exponent);
end
