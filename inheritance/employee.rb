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
        return self.get_subordinates_pay * multiplier
    end

    def get_subordinates_pay
        amount = 0
        self.employees.each do |employee| 
            amount += employee.salary
            amount += employee.get_subordinates_pay if employee.is_a?(Manager)
        end
        amount
    end
end

ed = Employee.new("Ed", "SalesRep", 10000, "Tom")

p ed.bonus(3)
jane = Employee.new("Jane", "SalesRep", 12000, "Tom")
tom = Manager.new("Tom", "SalesManager", 78000, "Kathy", [ed, jane])

p tom.bonus(4)
kathy = Manager.new("Kathy", "Founder", 1000000, nil, [tom])
p kathy.bonus(5)