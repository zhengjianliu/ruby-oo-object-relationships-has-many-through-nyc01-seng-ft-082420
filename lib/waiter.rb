require 'pry'
class Waiter
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

    def new_meal(current_customer, current_total, current_tip)
        Meal.new(self, current_customer,current_total, current_tip)
    end

    def meals
        Meal.all.filter{ |meal|
            meal.waiter == self
        }
    end

    def best_tipper
        max = 0
        best_customer = nil
        Meal.all.each{ |meal|
            if meal.tip > max
                max = meal.tip
                best_customer = meal.customer
            else
                max = max
                best_customer = best_customer
            end

        }
        best_customer
    end




end