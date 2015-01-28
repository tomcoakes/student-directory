@students = []

def print_menu
  puts "1. Input students"
    puts "2. Show the students"
    puts "9. Exit"
end

def show_students
  if @students.length > 0
    print_header()
    print(@students)
    print_footer(@students)
  else
    puts "\nYou haven't entered any students yet!\n\n"
  end
end


def interactive_menu
  loop do
    print_menu()
    selection = gets.chomp
    case selection
      when "1"
        @students = input_students()
      when "2"
        show_students()
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end


def remove_return_char(string)
  string.gsub(/\n/, '')
end

def input_students
  puts "\nPlease enter the name of the student, press return, then enter their cohort and press return again."
  puts "To finish, just hit return twice"

#  students = []
  name = remove_return_char(gets)
  
  if name == ''
    return @students
  end
  
  month = remove_return_char(gets).to_sym

  month = :February if month.empty?

  while !name.empty? do
    @students << {:name => name, :cohort => month, :bootcamp => :makersacademy}
    puts "Now we have #{@students.length} student" if @students.length == 1
    puts "Now we have #{@students.length} students" if @students.length > 1
    name = remove_return_char(gets)
    month = remove_return_char(gets).to_sym
    month = :February if month.empty?
  end
  @students
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
  puts
  puts "The students of my cohort at Makers Academy"
  puts "-----------------------------------".center(43)
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
  puts "\nOverall, we have #{names.length} great student" if names.length == 1
  puts "\nOverall, we have #{names.length} great students" if names.length > 1
  puts
end

interactive_menu

=begin
students = input_students
print_header
if students.length > 0
  print(students)
else
  puts "You didn't enter any students."
end
print_footer(students)
=end