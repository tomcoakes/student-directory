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
    puts "Now we have #{students.length} student" if students.length == 1
    puts "Now we have #{students.length} students" if students.length > 1
    name = gets.chomp
    month = gets.chomp.to_sym
    month = :February if month.empty?
  end
  students
end

def list_cohorts(students)
  array_of_cohorts = []
  students.each do |student|
    if !array_of_cohorts.include? student[:cohort]
      array_of_cohorts << student[:cohort]
    end
  end
  array_of_cohorts.sort
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "---------------".center(43)
  puts
end


def print(students)
  list_cohorts(students).each do |cohort|
    students.each_with_index do |student, index|
      if student[:cohort] == cohort.to_sym
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(43)
      end
    end
  end
end


def print_footer(names)
  puts "\nOverall, we have #{names.length} great students"
end


students = input_students
print_header
print(students)
print_footer(students)