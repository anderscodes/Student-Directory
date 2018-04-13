def input_students
  puts "Please enter the names of the students,then their cohort,  age and a hobby"
  puts "To finish, just hit return twice"
  # create an empty array
  students = [ ]
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
    students << {name: name, age: age, hobby: hobby, cohort: cohort} 
    if students.count <= 1
      puts "Now we have #{students.count} student"
    else
    puts "Now we have #{students.count} students"
  end
    #get another name from the user
        name = gets.chomp
  end
  # return the array of students
  students
end
  
# and then print them
def print_header
  puts "The students of Villians Academy"
  puts "------------"
end

def print(students)
  count = -1
  while true
    count += 1
      if students[count] == nil
      break
      else
        puts "#{students[count][:name].center(12)} (#{students[count][:cohort]} cohort) #{students[count][:age]} years old and likes #{students[count][:hobby]}"
      end
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
students = input_students

#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
