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

  def track_expenses
    expenses_by_employee = Hash.new {|hash, key| hash[key] = []}
    @departments.each do |department|
      department.expenses_breakdown.each do |name, hash|
        expenses_by_employee[hash[:employee]] << {purchase: name, amount: hash[:amount]}
      end
    end
    expenses_by_employee
  end
end