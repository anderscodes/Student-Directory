require 'csv'
@students = []

def print_menu
  puts "1. Input the Students"
  puts "2. Show the Students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from Students.csv"
  puts "9. Exit" #9. because we will be adding more items
end

def interactive_menu
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
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else 
    puts "I don't know what you meant, try again"
  end
end


def input_students
  puts "Please enter the names of the students, their cohort, age and a hobby"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "Cohort"
    cohort = STDIN.gets.chomp
    cohort = :November if cohort.empty?
    puts "Age"
    age = STDIN.gets.chomp
    puts "hobbies?"
    hobby = STDIN.gets.chomp
    # add the student hash to the array
    add_to_students(name, cohort, age, hobby)
    if @students.count <= 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = STDIN.gets.chomp
  end
  puts "Students input sucessfully"
end
  
def show_students
  print_header
  print_students_list
  print_footer
end


def print_header
  puts "The students of Villians Academy"
  puts "------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name].center(12)} (#{student[:cohort]} cohort) #{student[:age]} years old and likes #{student[:hobby]}"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "which file would you like to save to?"
    CSV.open(STDIN.gets.chomp, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort], student [:age], student[:hobby]]
     end
  end
  puts "Students saved sucessfully"
end

def try_load_students
  ARGV.first == nil ? filename = "students.csv" : filename = ARGV.first #first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
  puts "Students loaded sucessfully"
end

def load_students(filename = "students.csv")
  puts "which file would you like to load from?"
  filename = STDIN.gets.chomp
  CSV.foreach(filename) do |row|
      name, cohort, age, hobby = row
      add_to_students(name, cohort.to_sym, age, hobby)
    end
  puts "Load successful!"
end

def add_to_students(name, cohort, age, hobby)
  @students << {name: name, cohort: cohort.to_sym, age: age, hobby: hobby}
end

#nothing happens until we call the methods
try_load_students
interactive_menu