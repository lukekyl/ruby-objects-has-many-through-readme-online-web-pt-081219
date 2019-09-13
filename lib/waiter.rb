class Waiter
  attr_accessor :name, :yrs_experience
  @@all = []
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def new_meal(customer, total, tip = 0)
    Meal.new(self, customer, total, tip)
  end
  def meals
    Meal.all.select{|meal|
      meal.waiter == self
    }
  end
  def customers
    meals.map{|meal|
      meal.customer
    }
  end
  def best_tipper
    best_tipped_meal = meals.max{|meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    }
    best_tipped_meal.customer
  end
  def most_frequent
    most_frequent_customer = customers.max{|customer_a, customer_b|
      customer_a.meals.length <=> customer_b.meals.length
    }
    most_frequent_customer.name
  end
  
end