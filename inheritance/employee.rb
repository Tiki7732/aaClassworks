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

end

ed = Employee.new("Ed", "SalesRep", 50000, "Tom")
p ed.boss
p ed.bonus(2)
tom = Manager.new("Tom", "SalesManager", 75000, "Kathy", [ed])
p tom.boss
p tom.employees