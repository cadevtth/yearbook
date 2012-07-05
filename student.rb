require 'csv'

class Student
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :hometown
  
  def to_s
    "#{first_name} #{last_name}"
  end
  
  # a = Student.all
  
  def Student.all
    array_of_students = []

    CSV.foreach('students.csv', :headers => true) do |row|
      s = Student.new
      s.first_name = row['First Name']
      s.last_name = row['Last Name']
      s.hometown = row['Hometown']
      array_of_students.push(s)
    end
    
    return array_of_students
  end
end
