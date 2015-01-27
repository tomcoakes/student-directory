# Let's put all students into an array
students = [
  {:name => "Alex Parkinson", :cohort => :february},
  {:name => "Carrie Christenson", :cohort => :february},
  {:name => "Costas Sarris", :cohort => :february},
  {:name => "Diego Romero", :cohort => :february},
  {:name => "Erik Griffin", :cohort => :february},
  {:name => "Gabe Arafa", :cohort => :february},
  {:name => "Guido Vita Finzi", :cohort => :february},
  {:name => "Julian Veling", :cohort => :february},
  {:name => "Kate Beavis", :cohort => :february},
  {:name => "Kevin Lanzon", :cohort => :february},
  {:name => "Loris Fochesato", :cohort => :february},
  {:name => "Louise Beh", :cohort => :february},
  {:name => "Meads Chalcroft", :cohort => :february},
  {:name => "Paul Fitz", :cohort => :february},
  {:name => "Phil Brockwell", :cohort => :february},
  {:name => "Riz Ali", :cohort => :february},
  {:name => "Sean Haughton", :cohort => :february},
  {:name => "Sebastian Pires", :cohort => :february},
  {:name => "Thomas Strothjohann", :cohort => :february},
  {:name => "Tom Coakes", :cohort => :february},
  {:name => "Tommaso Bratto", :cohort => :february},
  {:name => "Vanessa Virgitti", :cohort => :february},
  {:name => "Yannick Brunner", :cohort => :february}
]

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "---------------"
end

def print(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

print_header
print(students)
print_footer(students)