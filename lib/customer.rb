require 'pry'
class Customer
    attr_accessor :name, :age
    @@all =[]
    def initialize (name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end
    def meals
        Meal.all.select{ |meal|
            meal.customer == self
        }
    end

    def waiters
        Meal.all.find_all{ |meal|
            meal.customer == self 
    }.map{ |meal| meal.waiter}
    
    end

    def new_meal(current_waiter, current_total, current_tip)
        Meal.new(current_waiter,self,current_total,current_tip)
    end
end