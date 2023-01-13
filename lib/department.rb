class Department
  attr_reader :name,
              :employees,
              :expenses
            
  def initialize(name)
    @name = name
    @employees = []
    @expenses = 0
    @expenses_breakdown = {}
  end

  def hire(employee)
    @employees.push(employee)
  end

  def expense(name, employee, amount)
    @expenses += amount
    @expenses_breakdown[name] = {amount: amount, employee: employee}
  end
  
  def expenses_breakdown
    @expenses_breakdown
  end
end