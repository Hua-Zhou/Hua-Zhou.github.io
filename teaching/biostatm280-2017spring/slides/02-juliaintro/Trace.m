function x = Trace(y)
  z = reshape(y, numel(y), 1);
  x = sum(z(1 + (0:(min(size(y)) - 1)) * (size(y, 1) + 1)));
end