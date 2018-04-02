function w = gcd2(x, y)
  if sum(y > 1.0e-4) == 0
    w = x;
  else
    y(y == 0) = x(y == 0);
    w = gcd2(y, mod(x, y));
  end
end