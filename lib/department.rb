class Department
  attr_reader :name,
              :employees
            
  def initialize(name)
    @name = name
    @employees = []
  end
end