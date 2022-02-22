require_relative "Employee"
require_relative "Manager"




david = Employee.new("David",10000,"TA")
shawna = Employee.new("Shawna",12000,"TA")
darren = Manager.new("Darren", 78000,"TA Manager",[shawna,david])
ned = Manager.new("Ned",1000000,"Founder",[darren,shawna,david])

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
