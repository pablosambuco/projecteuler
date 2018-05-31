#!/usr/bin/ruby
# coding: utf-8

# Distinct primes factors
# Problem 47 
# The first two consecutive numbers to have two distinct prime factors are:
# 
# 14 = 2 × 7
# 15 = 3 × 5
# 
# The first three consecutive numbers to have three distinct prime factors are:
# 
# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
# 
# Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?
#

require 'prime'

def br; "\n"; end

def listas_diferentes(lista1,lista2)
   for i in lista1
      for j in lista2
         if i == j 
            return false
         end
      end
   end
   return true
end

def comparar_listas(a,b,c,d)
   if a.length == 4 and b.length == 4 and c.length == 4 and d.length == 4
      if listas_diferentes(a,b) and listas_diferentes(a,c) and listas_diferentes(a,d) and listas_diferentes(b,c) and listas_diferentes(b,d) and listas_diferentes(c,d)
         return true
      else
         return false
      end
   else 
      return false
   end
end

bandera=false
valor1=0
while bandera == false 
   valor1=valor1+1
   valor2=valor1+1
   valor3=valor1+2
   valor4=valor1+3
   lista1=Prime.prime_division(valor1)
   lista2=Prime.prime_division(valor2)
   lista3=Prime.prime_division(valor3)
   lista4=Prime.prime_division(valor4)

   if comparar_listas(lista1,lista2,lista3,lista4)
      bandera=true
   end
   
end 
   
print valor1.to_s + ":" + lista1.to_s + br
print valor2.to_s + ":" + lista2.to_s + br
print valor3.to_s + ":" + lista3.to_s + br
print valor4.to_s + ":" + lista4.to_s + br
  