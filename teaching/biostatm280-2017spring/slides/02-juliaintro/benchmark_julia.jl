# Julia of the R Benchmark 2.5
# http://r.research.att.com/benchmarks/R-benchmark-25.R

runs = 5    # Number of times the tests are executed
times = zeros(5, 3)

println("\n\n   Julia Benchmark")
println("   ===============")
println("Number of times each test is run__________________________: $runs")
println("\n")

#************************ I. Matrix calculation ********************#

println("   I. Matrix calculation")
println("   ---------------------")

# (1)
gc()
cumulate = 0.0
for i = 1:runs
  timing = @elapsed begin
    a = randn(2500, 2500) / 10
    b = a'
    b = reshape(b, 1250, 5000)
    a = b'
end
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[1, 1] = timing
println("Creation, transp., deformation of a 2500x2500 matrix (sec): $timing")

# (2)
gc()
cumulate = 0.0
for i = 1:runs
  a = abs(randn(2500, 2500) / 2)
  timing = @elapsed (
    b = a.^1000
  )
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[2, 1] = timing
println("2400x2400 normal distributed random matrix ^1000____ (sec): $timing")

# (3)
gc()
cumulate = 0.0
for i = 1:runs
  a = randn(7000000)
  timing = @elapsed (
    b = sort(a, alg = QuickSort)
  )
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[3, 1] = timing
println("Sorting of 7,000,000 random values__________________ (sec): $timing")

# (4)
gc()
cumulate = 0.0
for i = 1:runs
  a = randn(2800, 2800)
  timing = @elapsed (
    b = a' * a
  )
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[4, 1] = timing
println("2800x2800 cross-product matrix (b = a' * a)_________ (sec): $timing")

# (5)
cumulate = 0.0
for i = 1:runs
  a = randn(2000, 2000)
  b = collect(1.0:2000.0)
  tmp1 = a' * a
  tmp2 = a' * b
  timing = @elapsed (
    c = tmp1 \ tmp2
  )
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[5, 1] = timing
println("Linear regr. over a 2000x2000 matrix (c = a \\ b')___ (sec): $timing")


#************************ II. Matrix functions ********************#

println("   II. Matrix functions");
println("   ---------------------");

# (1)
gc()
cumulate = 0.0
for i = 1:runs
  a = randn(2400000)
  timing = @elapsed (
    b = fft(a)
  )
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[1, 2] = timing
println("FFT over 2,400,000 random values____________________ (sec): $timing")

# (2)
gc()
cumulate = 0.0
for i = 1:runs
  a = randn(600, 600)
  timing = @elapsed (
    b = eigvals(a)
  )
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[2, 2] = timing
println("Eigenvalues of a 600x600 random matrix______________ (sec): $timing")

# (3)
gc()
cumulate = 0.0
for i = 1:runs
  a = randn(2500, 2500)
  timing = @elapsed (
    b = det(a)
  )
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[3, 2] = timing
println("Determinant of a 2500x2500 random matrix____________ (sec): $timing")

# (4)
gc()
cumulate = 0.0
for i = 1:runs
  tmp = randn(3000, 3000)
  a = tmp' * tmp
  timing = @elapsed (
    b = chol(a)
  )
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[4, 2] = timing
println("Cholesky decomposition of a 3000x3000 matrix________ (sec): $timing")

# (5)
gc()
cumulate = 0.0
for i = 1:runs
  a = randn(1600, 1600)
  timing = @elapsed (
    b = inv(a)
  )
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[5, 2] = timing
println("Inverse of a 1600x1600 random matrix________________ (sec): $timing")


#************************ III. Programmation ********************#

println("   III. Programmation");
println("   ---------------------");

# (1)
gc()
cumulate = 0.0
function fibfun(a)
  const phi = 1.6180339887498949
  return (phi .^ a - (-phi) .^ (-a)) / sqrt(5)
end
for i = 1:runs
  a = floor(rand(3500000) * 1000)
  timing = @elapsed (b = fibfun(a))
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[1, 3] = timing
println("3,500,000 Fibonacci numbers calculation (vector calc)(sec): $timing")

# (2)
gc()
cumulate = 0.0
function hilbertfun(n)
    [1 / (i + j - 1) for i in 1:n, j in 1:n]
end
for i = 1:runs
  timing = @elapsed hilbertfun(3000)
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[2, 3] = timing
println("Creation of a 3000x3000 Hilbert matrix (matrix calc) (sec): $timing")

# (3)
gc()
cumulate = 0
function gcd2(x, y)
  if sum(y .> 1.0e-4) == 0
    x
  else
    y[y .== 0] = x[y .== 0]
    gcd2(y, x .% y)
  end
end
for i = 1:runs
  a = ceil(rand(400000) * 1000)
  b = ceil(rand(400000) * 1000)
  timing = @elapsed (
    c = gcd2(a, b)
  )
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[3, 3] = timing
println("Grand common divisors of 400,000 pairs (recursion)__ (sec): $timing")

# (4)
gc()
cumulate = 0.0
function toeplitzfun(n)
  b = zeros(n, n)
  for j = 1:500
    for k = 1:500
      b[k, j] = abs(j - k) + 1
    end
  end
  b
end
for i = 1:runs
  timing = @elapsed (toeplitzfun(500))
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[4, 3] = timing
println("Creation of a 500x500 Toeplitz matrix (loops)_______ (sec): $timing")

# (5)
gc()
cumulate = 0.0
# Calculate the trace of a matrix (sum of its diagonal elements)
# function Trace(y)
#   sum(vec(y)[1 + [0:(minimum(size(y)) - 1)] * (size(y, 1) + 1)]);
# end
function escoufier(x)
  p = size(x, 1)
  vt = collect(1:p)
  vr = Int[]
  RV = collect(1.0:p)
  vrt = 0
  for j = 1:p
    Rvmax = 0
    for k = 1:(p-j+1)
      x2 = [x x[:, vr] x[:, vt[k]]]
      R = cor(x2)
      Ryy = R[1:p, 1:p]
      Rxx = R[(p+1):(p+j), (p+1):(p+j)]
      Rxy = R[(p+1):(p+j), 1:p]
      Ryx = Rxy'
      rvt = trace(Ryx * Rxy) / sqrt(trace(Ryy * Ryy) * trace(Rxx * Rxx))
      if rvt > Rvmax
        Rvmax = rvt
        vrt = vt[k]
      end
    end
    append!(vr, [vrt])
    RV[j] = Rvmax
    vt = vt[vt .!= vr[j]]
  end
end
for i = 1:runs
  x = abs(randn(45, 45))
  timing = @elapsed escoufier(x)
  cumulate = cumulate + timing
end
timing = cumulate / runs
times[5, 3] = timing
println("Escoufier's method on a 45x45 matrix (mixed)________ (sec): $timing")
