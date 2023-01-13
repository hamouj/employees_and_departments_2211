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

  describe 'small_expense_departments' do
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
end