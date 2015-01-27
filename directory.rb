# Let's put all students into an array
students = ["Alex Parkinson", "Carrie Christenson", "Costas Sarris", "Diego Romero", "Erik Griffin", "Gabe Arafa", "Guido Vita Finzi", "Julian Veling", "Kate Beavis", "Kevin Lanzon", "Loris Fochesato", "Louise Beh", "Meads Chalcroft", "Paul Fitz", "Phil Brockwell", "Riz Ali", "Sean Haughton", "Sebastian Pires", "Thomas Strothjohann", "Tom Coakes", "Tommaso Bratto", "Vanessa Virgitti", "Yannick Brunner"]

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "---------------"
end

def print(names)
  names.each { |name| puts name }
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

print_header
print(students)
print_footer(students)