#!/usr/bin/ruby
# coding: utf-8

# Divisor Sums
# Problem 608 
# Let D(m,n)=∑d|m∑k=1nσ0(kd) where d runs through all divisors of m and σ0(n) is the number of divisors of n.
# You are given D(3!,102)=3398 and D(4!,106)=268882292.
# 
# Find D(200!,1012) mod (109+7).

require 'prime'
require 'mathn'

def br; "\n"; end

def factorial(n)
   if n == 0
      1
   else
      if n> 0
         n * factorial(n-1)
      else 
         0
      end
   end   
end

def div(num)
  num.prime_division.inject(1){ |prod, n| prod *= n[1] + 1 } 
end

def factors(n)
   1.upto(Math.sqrt(n)).select {|i| (n % i).zero?}.inject([]) do |f, i| 
      f << i
      f << n / i unless i == n / i
      f
   end.sort
end

def D(m,n)
   res=0
   for d in factors(m)
      for k in 1..n
         res=res + div(d*k)
      end
   end
   res
end

#print D(factorial(3),10**2)
#print D(factorial(4),10**6)
print D(factorial(200),10**12) % (10**9 + 7)