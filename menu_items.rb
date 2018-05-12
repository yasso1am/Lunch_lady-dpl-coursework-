require_relative 'food'
require 'pry'

class MenuItems
  attr_accessor :maindish, :sidedish

  def initialize
    @maindish = maindish
    @sidedish = sidedish
##MAINS
  @steak = Food.new('Steak', 22)
  @eggplant = Food.new('Eggplant Parmesean', 14)
  @tikka = Food.new('Tikka Masala', 15)
  @salad = Food.new('Chicken Salad', 13)
  @padthai = Food.new('Pad Thai', 13)
  @falafel = Food.new('Falafel', 12)

##SIDES
  @potato = Food.new('Baked Potato', 6)
  @sidesalad = Food.new('Side Salad', 5)
  @calamari = Food.new('Calamari', 9)
  @olives = Food.new('Olives', 4)
  @beans = Food.new('Green Beans', 7)
  @mushrooms = Food.new('Sauteed Mushrooms', 6)

@maindish = [@steak, @eggplant, @tikka, @salad, @padthai, @falafel]

@sidedish = [@potato, @sidesalad, @calamari, @olives, @beans, @mushrooms]
end

def list_main_dish
  @maindish.each_with_index do |food, index|
  list_index = index + 1
	puts "\t#{list_index}] #{food.dish} - $#{food.price}"
  end
end

def pick_main(user_choice)
  pick = user_choice
  @maindish[pick - 1] do |food|
    puts "You chose #{food.dish} for #{food.price}"
binding.pry
  end
end

def list_side_dish
  @sidedish.each_with_index do |food, index|
  list_index = index + 1
	puts "\t#{list_index}] #{food.dish} - $#{food.price}"
  end
end

def view_food_menu
  puts "\t===Main Dishes==="
  list_main_dish
  puts "\t===Side Dishes==="
  list_side_dish
  puts
end
end
