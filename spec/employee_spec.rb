require './lib/employee'

describe Employee do
  let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})}

  describe '#initialize' do
    it 'exists' do
      expect(bobbi).to be_a(Employee)
    end

    it 'has a name' do
      expect(bobbi.name).to eq ("Bobbi Jaeger")
    end

    it 'has an age' do
      expect(bobbi.age).to eq(30)
    end

    it 'has a salary' do
      expect(bobbi.salary).to eq(100000)
    end
  end

  describe '#give_rasie()' do
    it 'gives the employee a raise' do
      bobbi.give_raise(5000)

      expect(bobbi.salary).to eq(105000)
    end
  end
end