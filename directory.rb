@students = []

def print_menu
  puts "1. Input students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  if @students.length > 0
    print_header
    print_students_list
    print_footer(@students)
  else
    puts "\nYou haven't entered any students yet!\n\n"
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end



def input_students
  puts "\nPlease enter the name of the student, press return, then enter their cohort and press return again."
  puts "To finish, just hit return twice"

  name = gets.chomp
  return @students if name == ''
  
  month = gets.chomp.to_sym
  month = :February if month.empty?

  while !name.empty? do
    @students << {:name => name, :cohort => month, :bootcamp => :makersacademy}
    puts "Now we have #{@students.length} student" if @students.length == 1
    puts "Now we have #{@students.length} students" if @students.length > 1
    name = gets.chomp
    month = gets.chomp.to_sym
    month = :February if month.empty?
  end
  @students
end

def list_cohorts()
  array_of_cohorts = []
  @students.each do |student|
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

def print_students_list
  list_cohorts.each do |cohort|
    @students.each_with_index do |student, index|
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



def save_students
  #open the file for writing
  file = File.open("students", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

interactive_menu