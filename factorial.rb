#!/usr/bin/env ruby
#==========================================================================

def x_apply_binary_operator_t1(x_identity_element,ar_in,
   func_operator_that_might_be_noncommutative)
   # This code is is a slightly edited version of the
   # kibuvits_s_concat_array_of_strings(...) core.
   # The comments and explanations are mostly there.
   #
   # May be the following link works:
   # https://github.com/martinvahi/mmmv_devel_tools/blob/master/src/bonnet/lib/kibuvits_ruby_library/src/include/kibuvits_str_concat_array_of_strings.rb
   #
   # If the next link works properly, then there
   # might be some demos for string concatenation at
   # https://github.com/martinvahi/mmmv_notes/tree/master/mmmv_notes/phenomenon_scrutinization/string_concatenation
   #
   # The general idea is that from memory
   # allocation point of view multiplication
   # is similar to string concatenation. An example:
   #
   #     new_string="100"+"000" # == "100000"
   #     new_number= 100 *1000  # ==  100000
   #
   #------------------------------
   cl=ar_in.class
   if cl!=Array
      raise(Exception.new("ar_in.class=="+cl.to_s+
      ", but it is expected to be Array.\n"))
   end # if
   cl=func_operator_that_might_be_noncommutative.class
   if cl!=Proc
      raise(Exception.new("func_operator_that_might_be_noncommutative.class=="+cl.to_s+
      ", but it is expected to be Proc.\n"))
   end # if
   #------------------------------
   func_oper=func_operator_that_might_be_noncommutative
   i_n=ar_in.size
   if i_n<3
      if i_n==2
         x_out=func_oper.call(ar_in[0],ar_in[1])
         return x_out
      else
         if i_n==1
            # For the sake of consistency one
            # wants to make sure that the returned
            # string instance always differs from those
            # that are within the ar_in.
            x_out=func_oper.call(x_identity_element,ar_in[0])
            return x_out
         else # i_n==0
            x_out=x_identity_element
            return x_out
         end # if
      end # if
   end # if
   x_out=x_identity_element # needs to be inited to the x_identity_element
   ar_1=ar_in
   b_ar_1_equals_ar_in=true # to avoid modifying the received Array
   ar_2=Array.new
   b_take_from_ar_1=true
   b_not_ready=true
   i_reminder=nil
   i_loop=nil
   i_ar_in_len=nil
   i_ar_out_len=0 # code after the while loop needs a number
   x_1=nil
   x_2=nil
   x_3=nil
   i_2=nil
   while b_not_ready
      # The next if-statement is to avoid copying temporary
      # strings between the ar_1 and the ar_2.
      if b_take_from_ar_1
         i_ar_in_len=ar_1.size
         i_reminder=i_ar_in_len%2
         i_loop=(i_ar_in_len-i_reminder)/2
         i_loop.times do |i|
            i_2=i*2
            x_1=ar_1[i_2]
            x_2=ar_1[i_2+1]
            x_3=func_oper.call(x_1,x_2)
            ar_2<<x_3
         end # loop
         if i_reminder==1
            x_3=ar_1[i_ar_in_len-1]
            ar_2<<x_3
         end # if
         i_ar_out_len=ar_2.size
         if 1<i_ar_out_len
            if b_ar_1_equals_ar_in
               ar_1=Array.new
               b_ar_1_equals_ar_in=false
            else
               ar_1.clear
            end # if
         else
            b_not_ready=false
         end # if
      else # b_take_from_ar_1==false
         i_ar_in_len=ar_2.size
         i_reminder=i_ar_in_len%2
         i_loop=(i_ar_in_len-i_reminder)/2
         i_loop.times do |i|
            i_2=i*2
            x_1=ar_2[i_2]
            x_2=ar_2[i_2+1]
            x_3=func_oper.call(x_1,x_2)
            ar_1<<x_3
         end # loop
         if i_reminder==1
            x_3=ar_2[i_ar_in_len-1]
            ar_1<<x_3
         end # if
         i_ar_out_len=ar_1.size
         if 1<i_ar_out_len
            ar_2.clear
         else
            b_not_ready=false
         end # if
      end # if
      b_take_from_ar_1=!b_take_from_ar_1
   end # loop
   if i_ar_out_len==1
      if b_take_from_ar_1
         x_out=ar_1[0]
      else
         x_out=ar_2[0]
      end # if
   else
      # The x_out has been inited to "".
      if 0<i_ar_out_len
         raise Exception.new("This function is flawed."+
         "\n GUID='1e84a702-39cb-458b-8728-f24371c06ed7'\n\n")
      end # if
   end # if
   return x_out
end # x_apply_binary_operator_t1


def i_factorial_t1(i_n)
   if i_n.class!=Integer
      return nil
   end # if
   if i_n<0
      return nil
   end # if

   i_out=1 # factorial(0)==1
   return i_out if i_n==0
   func_star=lambda do |x_a,x_b|
      x_out=x_a*x_b
      return x_out
   end # func_star
   ar_n=Array.new
   # For i_n==2, the ar_n==[0,1,2], ar_n.size==3 .
   # To avoid multiplication with 0, ar_n[0]==1 .
   # Therefore, for i_n==2, ar_n==[1,2] .
   i_n.times{|i| ar_n<<(i+1)} # i starts from 0
   x_identity_element=1
   i_out=x_apply_binary_operator_t1(x_identity_element,ar_n,func_star)
   return i_out
end # i_factorial_t1

#class Fixnum
#   def factorial
#      i_out=i_factorial_t1(self)
#      return i_out
#   end # factorial
#end # class Fixnum

class Numeric
   def factorial
      i_out=i_factorial_t1(self)
      return i_out
   end # factorial
end # class Numeric

#--------------------------------------------------------------------------

def i_factorial_old_style(i_n)
   i_factorial=1
   return i_factorial if (i_n==0)||(i_n==1)
   i_n.times do |i|
      i_factorial=i_factorial*(i+1)
   end # loop
   return i_factorial
end # i_factorial_old_style
