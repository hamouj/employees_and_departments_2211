require './lib/budget'
require './lib/department'
require './lib/employee'

describe Budget do
  let(:budget) {Budget.new(2023)}

  let(:customer_service) {Department.new("Customer Service")}
  let(:marketing) {Department.new("Marketing")}
  let(:sales) {Department.new("Sales")}

  let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})}
  let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}
  let(:jamison) {Employee.new({name: "Jamison Ordway", age: "19", salary: "120000"})}
  let(:dani) {Employee.new({name: "Dani Coleman", age: "20", salary: "120001"})}
  let(:abdul) {Employee.new({name: "Abdul Redd", age: "21", salary: "120002"})}

  describe '#initialize' do
    it 'exists' do
      expect(budget).to be_a(Budget)
    end

    it 'has a year' do
      expect(budget.year).to eq(2023)
    end

    it 'starts with no departments' do
      expect(budget.departments).to eq([])
    end
  end

  describe '#add_department()' do
    it 'adds departments to the budget' do
      budget.add_department(customer_service)
      budget.add_department(marketing)
      budget.add_department(sales)

      expect(budget.departments).to eq([customer_service, marketing, sales])
    end
  end

  describe '#small_expense_departments' do
    it 'lists departments with expenses less than 500' do
      budget.add_department(customer_service)
      budget.add_department(marketing)
      budget.add_department(sales)

      customer_service.expense(500)
      marketing.expense(200)
      sales.expense(150)

      expect(budget.small_expense_departments).to eq([marketing, sales])
    end
  end

  describe '#list_employee_salaries' do
    it 'lists all employee salaries' do
      budget.add_department(customer_service)
      budget.add_department(marketing)
      budget.add_department(sales)

      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      marketing.hire(jamison)
      marketing.hire(dani)
      sales.hire(abdul)
      
      expect(budget.list_employee_salaries).to eq([100000, 90000, 120000, 120001, 120002])
    end
  end
end