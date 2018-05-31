#!/usr/bin/ruby
# coding: utf-8

# Largest prime factor
# Problem 3 
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?
#

require 'prime'

def br; "\n"; end

print Prime.prime_division(600851475143).to_s + br
