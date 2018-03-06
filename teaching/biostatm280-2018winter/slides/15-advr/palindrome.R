# indiciate whether a number is a palindrome
palindrome <- function(num) {
  digits <- floor(log(num, 10))
  for (x in 0:((digits %/% 2) + 1)) {
    place1 <- digits - x
    place2 <- x
    digit1 <- (num %% (10 ^ (place1 + 1))) %/% (10 ^ place1)
    digiit2 <- (num %% (10 ^ (place2 + 1))) %/% (10 ^ place2)
    if (digit1 != digit2)
      return(FALSE)
  }
  return(TRUE)
}

# Find the largest palindrome that is the product of two 3-digit numbers
biggest_palindrome <- function() {
  best <- 0
  for (x in 100:999) {
    for (y in x:999) {
      candidate <- x * y
      if (candidate > best && palindrome(candidate)) {
        best <- candidate
      }
    }
  }
  best
}
