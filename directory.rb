@students = []

def input_students
  puts "Please enter the names of the students, their cohort, age and a hobby"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort"
    cohort = gets.chomp
    cohort = :November if cohort.empty?
    puts "Age"
    age = gets.chomp
    puts "hobbies?"
    hobby = gets.chomp
    # add the student hash to the array
    @students << {name: name, age: age, hobby: hobby, cohort: cohort} 
    if @students.count <= 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    #get another name from the user
    name = gets.chomp
  end
end
  
def interactive_menu
  loop do
  print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the Students"
  puts "2. Show the Students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from Students.csv"
  puts "9. Exit" #9. because we will be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
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
  
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, age, hobby = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, age: age, hobby: hobby}
  end
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student [:age], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

#nothing happens until we call the methods
interactive_menu
