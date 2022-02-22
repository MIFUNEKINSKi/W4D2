class Employee

  attr_accessor :bonus, :salary, :boss
  attr_reader :name, :title

  def initialize(name,salary,title)
    @name = name
    @salary = salary
    @title = title
    @boss = nil
    @bonus = 0
  end 

  def add_boss(boss_name)
    boss = boss_name
  end 

  def bonus(multiplyer)
    bonus = salary * multiplyer
  end 
end 

