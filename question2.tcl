#!/bin/tclsh
#to get interact with user/output

gets stdin <var>
puts stdout $<var>

#String Methods

set length [string length $mysString]
set upperstr [string toupper $mysString]
set replace [string map {TCL Linux} $mysString]
set replace [string map {" " ""} $myString]

set clean_sentence [string trim $sentence " "]
set word_count [llength $clean_sentence]

#if-elseif-else

if {$num == 0} {
  ##
} elseif {$num > 0} {
  ##
} else {
  ##
}

# File Systems

if { $argc != 2 } {
  puts "Use two arguments"
  exit 1
}

set file1 [lindex $argv 0]
set file2 [lindex $argv 1]

if {[file size $file1] != [file size $file2]} {
  puts "files not same size"
  exit 0
}

set f1 [open $file1 r]
set f2 [open $file2 r]

set data1 [read $f1]
set data2 [read $f2]

close $f1
close $f2

if {[string equal $data1 $data2]} {
  ##
} else {
  ##
}

[file exists $fileName]

#for loop

# 1 
puts reversed ""

set len [string length $str]

for {set i [expr {$len - 1}]} {$i >= 0} {incr $i -1} {
  append reversed [string index $str $i]
}

# 2
set randomNumbers {}

for {set i 0} {$i < 10} {incr i} {
  set num [expr {int(rand() * 100) + 1}]
  lappend randNumbers $num
}

# 3 

for {set i 0} {$i < 10} {incr i} {
  for {set j 0} {$j < 10} {incr j} {
    set num [expr {$i * $j}]
  }
  put " "
}


# Basic Syntax

puts [expr 3 + 2] ;# print sum of the 3 and 2 

# Variable Substitution
set a 3
puts $a

set myVariable 18
puts [expr $myVariable + 6 + 9]

# String representation

set myVariable hello
puts $myVariable

set myVariable "hello world"
puts $myVariable
set myVariable {hello world}
puts $myVariable

# Lists

set myVariable {red green blue}
puts [lindex $myVariable 2]

# Associative Arrays

set  marks(english) 80
puts $marks(english)
set  marks(mathematics) 90
puts $marks(mathematics)

set {variable B} test
puts ${variable B}

set sum [expr $variableA +20];
puts $sum

# If 

if { $a < 20 } {
   puts "a is less than 20" 
}

# If else 

if {$a < 20 } { 
   puts "a is less than 20"
} else {
   puts "a is not less than 20"
}

# Nested
if { $a == 100 } {
   if { $b == 200 } { 
      puts "Value of a is 100 and b is 200"
   }
}

# Switch

switch $grade {
   A {
      puts "Well done!"
   }
   B {
      puts "Excellent!"
   }

   C {
      puts "You passed!"
   }
   F {
      puts "Better try again"
   }
   default {
      puts "Invalid grade"
   }
}

# nested switch

switch $a {
   100 {
      puts "This is part of outer switch"
      switch $b {
         200 {
            puts "This is part of inner switch!"
         }
      }
   }   
}

set b [expr $a == 10 ? 20: 30]

# while loop

while { $a < 20 } {
   puts "value of a: $a"
   incr a
}

# For loop

for {set a 10}  {$a < 20} {incr a} {
   puts "value of a: $a"
}

# break statement

while {$a < 20 } {
   puts "value of a: $a"
   incr a
   if { $a > 15} {
      # terminate the loop using break statement 
      break
   }
}

# continue 

while { $a < 20 } {
   if {$a == 15} {
      #skip the iteration 
      incr a
      continue
   }
   puts "value of a: $a"
   incr a     
}

# Arrays

set languages(0) Tcl
set languages(1) "C Language"
puts $languages(0)
puts $languages(1)

[array size variablename]

for { set index 0 }  { $index < [array size languages] }  { incr index } {
   puts "languages($index) : $languages($index)"
}

# Associative Arrays

set personA(Name) "Dave"
set personA(Age) 14
puts  $personA(Name)
puts  $personA(Age)

[array names variablename] #indices names

foreach index [array names personA] {
   puts "personA($index): $personA($index)"
}


#Strings

#string comparison

set s1 "Hello"
set s2 "World"
set s3 "World"
puts [string compare $s1 $s2]
if {[string compare $s2 $s3] == 0} {
   puts "String \'s1\' and \'s2\' are same.";
}

if {[string compare $s1 $s2] == -1} {
   puts "String \'s1\' comes before \'s2\'.";
}

if {[string compare $s2 $s1] == 1} {
   puts "String \'s2\' comes after \'s1\'.";
}

# string insertion

set s1 "Hello World"
set s2 "o"
puts "First occurrence of $s2 in s1"
puts [string first $s2 $s1]
puts "Character at index 0 in s1"
puts [string index $s1 0]
puts "Last occurrence of $s2 in s1"
puts [string last $s2 $s1]
puts "Word end index in s1"
puts [string wordend $s1 20]
puts "Word start index in s1"
puts [string wordstart $s1 20]

# lenght of string

puts [string length $s1]

#handling cases

puts [string toupper $s1]
puts [string tolower $s1]

# Trimming Characters

puts [string trimright $s1 $s2]
puts [string trimleft $s1 $s2]
puts [string trim $s1 $s2]

# matching strings

puts [string match "*@*.com" $s1]
puts [string match {tcl} $s1]

#append

set s1 "Hello" 
append s1 " World"

# Lists

set colorList1 {red green blue}
set colorList2 [list red green blue]
set colorList3 [split "red_green_blue" _]

set var orange
append var " " "blue"
lappend var "red" 
lappend var "green" 
puts $var

puts [llength $var]

puts [lindex $var  1]

set var {orange blue red green}
set var [linsert  $var 3 black white]
puts $var

set var {orange blue red green}
set var [lreplace $var 2 3 black white]
puts $var

set var {orange blue red green}
lset var 0 black 
puts $var

set var {orange blue red green}
lassign $var colour1 colour2
puts $colour1
puts $colour2

set var {orange blue red green}
set var [lsort $var]
puts $var

# Dictionaries

dict set colours  colour1 red 
puts $colours
dict set colours  colour2 green

set colours [dict create colour1 "black" colour2 "white"]

puts [dict size $colours]

foreach item [dict keys $colours] {
   set value [dict get $colours $item]
   puts $value
}

set value [dict get $colours colour1]

set keys [dict keys $colours]
set values [dict values $colours]

set result [dict exists $colours colour1]


# Procedures 

proc add {a b} {
   return [expr $a+$b]
}
puts [add 10 30]



proc avg {numbers} {
   set sum 0
   foreach number $numbers {
      set sum  [expr $sum + $number]
   }
   set average [expr $sum/[llength $numbers]]
   return $average
}
puts [avg {70 80 50 60}]
puts [avg {70 80 50 }]



proc add {a {b 100} } {
   return [expr $a+$b]
}
puts [add 10 30]
puts [add 10]


proc factorial {number} {
   if {$number <= 1} {
      return 1
   } 
   return [expr $number * [factorial [expr $number - 1]]]

}
puts [factorial 3]
puts [factorial 5]







