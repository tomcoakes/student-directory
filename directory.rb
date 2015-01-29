require 'CSV'

@students = []

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.length} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

############################

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students(choose_file)
    when "4"
      load_students(choose_file)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def choose_file
  puts "What's the name of the file you wish to load/save from/to?"
  filename = gets.chomp
end

def print_menu
  puts "1. Input students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

############################

def input_students
  puts "\nPlease enter the name of the student, press return, then enter their cohort and press return again."
  puts "To finish, just hit return twice"

  name = STDIN.gets.chomp
  return @students if name == ''
  
  month = STDIN.gets.chomp
  month = :February if month.empty?

  while !name.empty? do
    add_to_students_array(name, month)
    puts "Now we have #{@students.length} student" if @students.length == 1
    puts "Now we have #{@students.length} students" if @students.length > 1
    name = STDIN.gets.chomp
    month = STDIN.gets.chomp.to_sym
    month = :February if month.empty?
  end
  @students
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

############################

def add_to_students_array(name, month)
  @students << {:name => name, :cohort => month.to_sym}
end

def list_cohorts()
  array_of_cohorts = []
  @students.each do |student|
    if !array_of_cohorts.include? student[:cohort]
      array_of_cohorts << student[:cohort]
    end
  end
  array_of_cohorts
end

############################

def load_students(filename = "students.csv")
  if !File.exists?(filename)
    puts "I can't find that file... Are you sure it exists?\n\n"
    return
  else
    CSV.foreach(filename) do |row|
      name, month = row
      add_to_students_array(name, month)
    end
  end
end

def save_students(filename = "students.csv")
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
end

############################

interactive_menu