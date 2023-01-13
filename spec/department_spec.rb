require './lib/department'
require './lib/employee'

describe Department do
  let(:customer_service) {Department.new("Customer Service")}
  let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})}
  let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}

  describe '#initialize' do
    it 'exists' do
      expect(customer_service).to be_a(Department)
    end

    it 'has a name' do
      expect(customer_service.name).to eq("Customer Service")
    end

    it 'starts with no employees' do
      expect(customer_service.employees).to eq([])
    end

    it 'starts with no expenses' do
      expect(customer_service.expenses).to eq(0)
      expect(customer_service.expenses_breakdown).to eq({})
    end
  end

  describe '#hire()' do
    it 'hires employees' do
      customer_service.hire(bobbi)
      customer_service.hire(aaron)

      expect(customer_service.employees).to eq([bobbi, aaron])
    end
  end

  describe '#expense()' do
    it 'adds expenses' do
      customer_service.expense("computer", bobbi, 100)
      customer_service.expense("headphones", bobbi, 25)
      
      expect(customer_service.expenses).to eq(125)
    end
  end

  describe '#expenses_breakdown' do
    it 'breakdowns the expense by name and employee' do
      customer_service.expense("computer", bobbi, 100)
      customer_service.expense("headphones", bobbi, 25)

      expected_hash = {
        "computer" => {
                        amount: 100,
                        employee: bobbi
                      },
        "headphones" => {
                        amount: 25,
                        employee: bobbi
                        }
      }

      expect(customer_service.expenses_breakdown).to eq(expected_hash)
    end
  end
end