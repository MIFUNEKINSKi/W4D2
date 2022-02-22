require_relative "Employee"

class Manager < Employee
  attr_accessor :employees, :bonus
  def initialize(name,salary,title,employees)
    super(name,salary,title)
    @employees = employees
  end 

    def bonus(multiplyer)
      salary_sum = 0
      employees.each do |employee|
        salary_sum += employee.salary 
      end 
      bonus = salary_sum * multiplyer
    end 
end 