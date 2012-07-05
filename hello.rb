require 'csv'
require './student'

array_of_students = []

CSV.foreach('students.csv', :headers => true) do |row|
  s = Student.new
  s.first_name = row['First Name']
  s.last_name = row['Last Name']
  s.hometown = row['Hometown']
  array_of_students.push(s)
end

def to_string(student)
  "#{student.first_name} #{student.last_name} is from #{student.hometown}."
end

# HINT: DO NOT OVER-ENGINEER
# Just get it to work.

def to_html(student)
  "<li class='frame'>
	  <img class='thumbnail' width='200' height='200' src='images/#{student.first_name} #{student.last_name}.jpg'>
	  <p class='name'>#{student.first_name} #{student.last_name}</p>
	  <p class='hometown'>Chicago</p>
	</li>"
end

def output_to_terminal(students)
  puts 'HELLO CODE ACADEMY'
  puts '------------------'
  students.each do |student_hash|
    puts to_string(student_hash)
  end
end

def output_to_browser(students)
  f = File.new('hello.html', 'w')
  f.puts "<html>"
  f.puts "	<head>"
  f.puts "		<title>Hello CA</title>"
  f.puts "		<link rel='stylesheet' href='reset.css' type='text/css'>"
  f.puts "		<link rel='stylesheet' href='styles.css' type='text/css'>"
  f.puts "		<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>"
  f.puts "	</head>"
  f.puts "	<body>"
  f.puts "		<h1>"
  f.puts "			Hello Code Academy"
  f.puts "		</h1>"
  f.puts "		<ul>"
  students.each do |student_hash|
    f.puts to_html(student_hash)
  end
  f.puts "		</ul>"
  f.puts "	</body>"
  f.puts "</html>"
  f.close
end

output_to_terminal(array_of_students)
output_to_browser(array_of_students)









