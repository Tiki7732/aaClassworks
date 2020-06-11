class Employee

    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        amount = salary * multiplier
        return amount
    end
end

class Manager < Employee
    
    attr_reader :employees
    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        amount = 0
        employees.each do |employee| 
            amount += employee.salary 
            if employee.is_a?(Manager)
                employee.employees.each {|subordiantes| amount += subordiantes.salary}
            end
        end
        return amount * multiplier
    end
end

ed = Employee.new("Ed", "SalesRep", 50000, "Tom")
p ed.boss
p ed.bonus(2)
jane = Employee.new("Jane", "SalesRep", 50000, "Tom")
tom = Manager.new("Tom", "SalesManager", 75000, "Kathy", [ed, jane])
p tom.boss
p tom.employees
p tom.bonus(2)
kathy = Manager.new("Kathy", "Founder", 100000, nil, [tom])
p kathy.bonus(2)