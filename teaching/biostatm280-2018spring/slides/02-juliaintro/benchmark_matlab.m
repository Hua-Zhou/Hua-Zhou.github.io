% MATLAB version of the R Benchmark 2.5
% http://r.research.att.com/benchmarks/R-benchmark-25.R

runs = 5;    % Number of times the tests are executed
times = zeros(5, 3);

fprintf('\n\n   MATLAB Benchmark\n');
fprintf('   ===============\n');
fprintf('Number of times each test is run__________________________: %d\n', ...
  runs);
fprintf('\n');

%************************ I. Matrix calculation ********************%

fprintf('   I. Matrix calculation\n');
fprintf('   ---------------------\n');

% (1)
cumulate = 0; a = 0; b = 0; timing = 0;
for i = 1:runs
  tic;
  a = randn(2500, 2500) / 10;
  b = a';
  b = reshape(b, 1250, 5000);
  a = b';
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(1, 1) = timing;
fprintf('Creation, transp., deformation of a 2500x2500 matrix (sec): %f\n', ...
  timing);

% (2)
cumulate = 0; b = 0;
for i = 1:runs
  a = abs(randn(2500, 2500) / 2);
  tic;
  b = a.^1000;
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(2, 1) = timing;
fprintf('2400x2400 normal distributed random matrix ^1000____ (sec): %f\n', ...
  timing);

% (3)
cumulate = 0; b = 0;
for i = 1:runs
  a = randn(7000000, 1);
  tic;
  b = sort(a);
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(3, 1) = timing;
fprintf('Sorting of 7,000,000 random values__________________ (sec): %f\n', ...
  timing);

% (4)
cumulate = 0; b = 0;
for i = 1:runs
  a = randn(2800, 2800);
  tic;
  b = a' * a;
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(4, 1) = timing;
fprintf('2800x2800 cross-product matrix (b = at * a)_________ (sec): %f\n', ...
  timing);

% (5)
cumulate = 0; c = 0;
for i = 1:runs
  a = randn(2000, 2000);
  b = [1:2000]';
  tmp1 = a' * a;
  tmp2 = a' * b;
  tic;
  c = tmp1 \ tmp2;
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(5, 1) = timing;
fprintf('Linear regr. over a 2000x2000 matrix (c = a \\ bt)___ (sec): %f\n', ...
  timing);


%************************ II. Matrix functions ********************%

fprintf('   II. Matrix functions\n');
fprintf('   ---------------------\n');

% (1)
cumulate = 0; b = 0;
for i = 1:runs
  a = randn(2400000, 1);
  tic;
  b = fft(a);
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(1, 2) = timing;
fprintf('FFT over 2,400,000 random values____________________ (sec): %f\n', ...
  timing);

% (2)
cumulate = 0; b = 0;
for i = 1:runs
  a = randn(600, 600);
  tic;
  b = eig(a);
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(2, 2) = timing;
fprintf('Eigenvalues of a 600x600 random matrix______________ (sec): %f\n', ...
  timing);

% (3)
cumulate = 0; b = 0;
for i = 1:runs
  a = randn(2500, 2500);
  tic;
  b = det(a);
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(3, 2) = timing;
fprintf('Determinant of a 2500x2500 random matrix____________ (sec): %f\n', ...
  timing);

% (4)
cumulate = 0; b = 0;
for i = 1:runs
  tmp = randn(3000, 3000);
  a = tmp' * tmp;
  tic;
  b = chol(a);
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(4, 2) = timing;
fprintf('Cholesky decomposition of a 3000x3000 matrix________ (sec): %f\n', ...
  timing);

% (5)
cumulate = 0; b = 0;
for i = 1:runs
  a = randn(1600, 1600);
  tic;
  b = inv(a);
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(5, 2) = timing;
fprintf('Inverse of a 1600x1600 random matrix________________ (sec): %f\n', ...
  timing);


%************************ III. Programmation ********************%

fprintf('   III. Programmation\n');
fprintf('   ---------------------\n');

% (1)
cumulate = 0; a = 0; b = 0; phi = 1.6180339887498949;
for i = 1:runs
  a = floor(rand(3500000, 1) * 1000);
  tic;
  b = (phi .^ a - (-phi) .^ (-a)) / sqrt(5);
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(1, 3) = timing;
fprintf('3,500,000 Fibonacci numbers calculation (vector calc)(sec): %f\n', ...
  timing);

% (2)
cumulate = 0; a = 3000; b = 0;
for i = 1:runs
  tic;
  b = repmat([1:a]', 1, a);
  b = 1 ./ (b' + repmat([0:(a-1)]', 1, a));
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(2, 3) = timing;
fprintf('Creation of a 3000x3000 Hilbert matrix (matrix calc) (sec): %f\n', ...
  timing);

% (3)
cumulate = 0; c = 0;
for i = 1:runs
  a = ceil(rand(400000, 1) * 1000);
  b = ceil(rand(400000, 1) * 1000);
  tic;
  c = gcd2(a, b);
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(3, 3) = timing;
fprintf('Grand common divisors of 400,000 pairs (recursion)__ (sec): %f\n', ...
  timing);

% (4)
cumulate = 0; b = 0;
for i = 1:runs
  b = zeros(500, 500);
  tic;
  for j = 1:500
    for k = 1:500
      b(k, j) = abs(j - k) + 1;
    end
  end
  timing = toc;
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(4, 3) = timing;
fprintf('Creation of a 500x500 Toeplitz matrix (loops)_______ (sec): %f\n', ...
  timing);

% (5)
cumulate = 0; p = 0; vt = 0; vr = 0; vrt = 0; rvt = 0; RV = 0; j = 0; k = 0;
x2 = 0; R = 0; Rxx = 0; Ryy = 0; Rxy = 0; Ryx = 0; Rvmax = 0;
for i = 1:runs
  x = abs(randn(45, 45));
  tic();
  p = 45;
  vt = 1:p;
  vr = [];
  RV = 1:p;
  vrt = 0;
  for j = 1:p
    Rvmax = 0;
    for k = 1:(p-j+1)
      x2 = [x x(:, vr) x(:, vt(k))];
      R = corrcoef(x2);
      Ryy = R(1:p, 1:p);
      Rxx = R((p+1):(p+j), (p+1):(p+j));
      Rxy = R((p+1):(p+j), 1:p);
      Ryx = Rxy';
      rvt = Trace(Ryx * Rxy) / sqrt(Trace(Ryy * Ryy) * Trace(Rxx * Rxx));
      if rvt > Rvmax
        Rvmax = rvt;
        vrt = vt(k);
      end
    end
    vr(j) = vrt;
    RV(j) = Rvmax;
    vt = vt(vt ~= vr(j));
  end
  timing = toc();
  cumulate = cumulate + timing;
end
timing = cumulate / runs;
times(5, 3) = timing;
fprintf('Escoufiers method on a 45x45 matrix (mixed)_________ (sec): %f\n', ...
  timing);
