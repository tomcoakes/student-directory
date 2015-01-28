# Let's put all students into an array
def input_students
  puts "Please enter the name of the student, press return, then enter their cohort and press return again."
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
  month = gets.chomp.to_sym

  month = :February if month.empty?

  while !name.empty? do
    students << {:name => name, :cohort => month, :bootcamp => :makersacademy}
    puts "Now we have #{students.length} students"
    name = gets.chomp
    month = gets.chomp.to_sym
    month = :February if month.empty?
  end

  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "---------------".center(43)
  puts
end

def print(students)
  students.each_with_index { |student, index| puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(43) }

  #  i = 0
  #  while i < students.length
  #    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]})"
  #    i += 1
  #  end

end

def print_footer(names)
  puts "\nOverall, we have #{names.length} great students"
end

students = input_students
print_header
print(students)
print_footer(students)