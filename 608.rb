#!/usr/bin/ruby
# coding: utf-8

# Divisor Sums
# Problem 608 
# Let D(m,n)=∑d|m∑k=1nσ0(kd) where d runs through all divisors of m and σ0(n) is the number of divisors of n.
# You are given D(3!,102)=3398 and D(4!,106)=268882292.
# 
# Find D(200!,1012) mod (109+7).

require 'prime'

def br; "\n"; end

def div(num)
  num.prime_division.inject(1){ |prod, n| prod *= n[1] + 1 } 
end

def D2(m,n)
   res=0
   factores(m).each { |d| (1..n).each { |k| res+=div(d*k)} }
   res
end

def factores(x)
   a=[1]
   (1..x).each {
      |y| 
      a1=*a
      a.concat(a1.map{|i|i*y})
      y.prime_division.map{|n| n[0]}.select{|z| z!=y}.map{
         |z| 
         a.concat(a1.map{|i|i*z}.select{|n| n>y})
      }
   }
   a.uniq.sort
end

#t0=Time.now
##print D2(3,10**2).to_s + br
#print D2(4,10**6).to_s + br
##print (D2(200,10**12) % (10**9 + 7)).to_s + br
#t1=Time.now
#s=t1-t0  
#print s.to_s + "s" + br

(1..20).each {
   |n|
   print n.to_s + "\t" 
   t0=Time.now
   x=factores(n)
   t1=Time.now
   s=t1-t0  
   print s.to_s + br
}