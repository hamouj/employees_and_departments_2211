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
end