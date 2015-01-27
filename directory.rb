# Let's put all students into an array
students = ["Alex Parkinson", "Carrie Christenson", "Costas Sarris", "Diego Romero", "Erik Griffin", "Gabe Arafa", "Guido Vita Finzi", "Julian Veling", "Kate Beavis", "Kevin Lanzon", "Loris Fochesato", "Louise Beh", "Meads Chalcroft", "Paul Fitz", "Phil Brockwell", "Riz Ali", "Sean Haughton", "Sebastian Pires", "Thomas Strothjohann", "Tom Coakes", "Tommaso Bratto", "Vanessa Virgitti", "Yannick Brunner"]

# And then print them
puts "The students of my cohort at Makers Academy"
puts "---------------"

students.each do |student|
  puts student
end

# Finally we print the total
puts "Overall, we have #{students.length} great students"