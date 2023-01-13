class Department
  attr_reader :name,
              :employees
            
  def initialize(name)
    @name = name
    @employees = []
  end

  def hire(employee)
    @employees.push(employee)
  end
end