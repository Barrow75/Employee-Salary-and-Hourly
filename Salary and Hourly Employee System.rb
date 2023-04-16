class Employee
  attr_accessor :user_id,:first_name,:last_name,:middle_initial,:department_code

  def initialize(user_id,first_name,last_name,middle_initial, department_code)
    @user_id = user_id
    @first_name = first_name
    @last_name = last_name
    @middle_initial = middle_initial
    @department_code = department_code

  end

end

class SalariedEmployee < Employee
  attr_accessor :monthly_salary

  def initialize(user_id,first_name,last_name,middle_initial, department_code,monthly_salary)
    super(user_id, first_name, last_name, middle_initial, department_code)
    @monthly_salary = monthly_salary
  end

  def salary_Calculation 
    fraction = 1.0
    monthly_salary * fraction
  end
end
    
class HourlyEmployee < Employee
  attr_accessor :hourly_rate, :hours_worked 

  def initialize(user_id,first_name,last_name,middle_initial, department_code,hourly_rate,hours_worked)
    super(user_id, first_name, last_name, middle_initial, department_code)
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
    end

  def calculate_pay
    regular_hours = [hours_worked, 40].min
    overtime_hours = [hours_worked - 40, 0].max
    regular_pay = regular_hours * hourly_rate
    overtime_pay = overtime_hours * hourly_rate * 1.5
    total_pay = regular_pay + overtime_pay
    return total_pay
  end
end

puts "Enter information for salaried employee:"
print "User ID: "
user_id = Integer(gets.chomp)
#user_id = gets.chomp
print "First name: "
first_name = gets.chomp
print "Last name: "
last_name = gets.chomp
print "Middle initial: "
middle_initial = gets.chomp
print "Department code: "
#department_code = Integer(gets.chomp)
department_code = gets.chomp
print "Monthly salary: "
monthly_salary = Integer(gets.chomp)


# Create salaried employee object
salaried_employee = SalariedEmployee.new(user_id, first_name, last_name, middle_initial, department_code, monthly_salary)

# Get user input for hourly employee
puts "Enter information for hourly employee:"
print "User ID: "
user_id = Integer(gets.chomp)
# user_id = gets.chomp
print "First name: "
first_name = gets.chomp
print "Last name: "
last_name = gets.chomp
print "Middle initial: "
middle_initial = gets.chomp
print "Department code: "
#department_code = Integer(gets.chomp)
department_code = gets.chomp
print "Hourly rate: "
hourly_rate = Integer(gets.chomp.to_f)
#hourly_rate = gets.chomp.to_f
print "Hours worked: "
hours_worked = Integer(gets.chomp.to_f)
#hours_worked = gets.chomp.to_f

# Create hourly employee object
hourly_employee = HourlyEmployee.new(user_id, first_name, last_name, middle_initial, department_code, hourly_rate, hours_worked)

# Calculate pay for each employee
salaried_pay = salaried_employee.salary_Calculation
hourly_pay = hourly_employee.calculate_pay

# Display results
puts "Salaried employee monthly pay: $#{salaried_pay}"
puts "Hourly employee total pay: $#{hourly_pay}"

