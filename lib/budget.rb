class Budget
  attr_reader :year,
              :departments

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments.push(department)
  end

  def small_expense_departments
    @departments.select do |department|
      department.expenses < 500
    end
  end

  def list_employee_salaries
    @departments.flat_map do |department|
      department.employees.map do |employee|
        employee.salary
      end
    end
  end
end