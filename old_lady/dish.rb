class Food
  attr_accessor :dish, :price

  def intialize(dish, price)
    @dish = dish
    @price = price
  end

  def info
    puts "#{@dish} - #{@price}"
  end
