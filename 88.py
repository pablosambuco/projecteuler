"""
A natural number, N, that can be written as the sum and product of a given set 
of at least two natural numbers, {a1, a2, ..., ak} is called a product-sum 
number: N = a1 + a2 + ... + ak = a1 x a2 x ... x ak.

For example, 6 = 1 + 2 + 3 = 1 x 2 x 3.

For a given set of size, k, we shall call the smallest N with this property a 
minimal product-sum number. The minimal product-sum numbers for sets of size, 
k = 2, 3, 4, 5, and 6 are as follows:

- k=2: 4 = 2 x 2 = 2 + 2
- k=3: 6 = 1 x 2 x 3 = 1 + 2 + 3
- k=4: 8 = 1 x 1 x 2 x 4 = 1 + 1 + 2 + 4
- k=5: 8 = 1 x 1 x 2 x 2 x 2 = 1 + 1 + 2 + 2 + 2
- k=6: 12 = 1 x 1 x 1 x 1 x 2 x 6 = 1 + 1 + 1 + 1 + 2 + 6

Hence for 2 <= k <= 6, the sum of all the minimal product-sum numbers is 
4+6+8+12 = 30; note that 8 is only counted once in the sum.

In fact, as the complete set of minimal product-sum numbers for 2 <= k <= 12 
is {4, 6, 8, 12, 15, 16}, the sum is 61.

What is the sum of all the minimal product-sum numbers for 2 <= k <= 12000?
"""

from itertools import combinations_with_replacement

mem = {}

def minimal_productsum(n):
    if n in mem:
        return mem[n]
    minimal = n * n
    arrays = list(range(1, n + 1))
    for array in combinations_with_replacement(arrays, n):
        array_sum = sum(array)
        if array_sum >= minimal:
            continue
        array_prod = 1
        for num in array:
            array_prod *= num
            if array_prod > minimal:
                break
        if array_prod == array_sum:
            minimal = array_sum
    mem[n] = minimal
    return minimal


def get_answer(begin, end):
    print(sum(set([minimal_productsum(n) for n in range(begin, end + 1)])))


if __name__ == "__main__":
    get_answer(2, 12)
    print(mem)
