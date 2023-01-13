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

  def total_expenses_by_employee(employee)
    total_expenses_by_employee = 0
    @departments.each do |department|
      department.expenses_breakdown.each do |name, hash|
        total_expenses_by_employee += hash[:amount] if employee == hash[:employee]
      end
    end
    total_expenses_by_employee
  end

  def employee_made_expenses
    employee_made_expenses = {}
    @departments.each do |department|
      department.expenses_breakdown.each do |name, hash|
        employee_made_expenses[name] = hash[:employee]
      end
    end
    employee_made_expenses
  end
end