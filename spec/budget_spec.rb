require './lib/budget'
require './lib/department'
require './lib/employee'

describe Budget do
  let(:customer_service) {Department.new("Customer Service")}
  let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})}
  let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}
  let(:budget) {Budget.new(2023)}

  describe '#initialize' do
    it 'exists' do
      expect(budget).to be_a(Budget)
    end

    it 'has a year' do
      expect(budget.year).to eq(2023)
    end
  end
end