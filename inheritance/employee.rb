class Employee

    attr_reader :name, :title, :salary
    attr_accessor :boss
    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss
        #self.boss.add_employee(self) unless self.boss.nil?
        boss
    end

    def bonus(multiplier)
        amount = salary * multiplier
        return amount
    end
end

class Manager < Employee
    
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employee(subordinate)
        employees.push(subordinate)
        subordinate
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
kathy = Manager.new("Kathy", "Founder", 1000000, nil)

tom = Manager.new("Tom", "SalesManager", 78000, "Kathy")
kathy.add_employee(tom)
jane = Employee.new("Jane", "SalesRep", 12000, "Tom")
ed = Employee.new("Ed", "SalesRep", 10000, "Tom")
tom.add_employee(jane)
tom.add_employee(ed)
p ed.bonus(3)



p tom.bonus(4)

p kathy.bonus(5)