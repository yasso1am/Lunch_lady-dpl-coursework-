require_relative 'menu_items'

class App
  attr_accessor :cart

  def initialize
    @cart = []
    main_menu
  end

  def main_menu
    puts "\n"
    puts "Welcome to Chez DPL"
    puts "\t1) View the entire menu"
    puts "\t2) Start a new order"
    puts "\t3) Quit"
    get_user_selection
  end

def get_user_selection
  choice = gets.to_i
  case choice
  when 1
    view_food_menu
  when 2
    Order.new(self)
  when 3
    puts "Enjoy your meal"
    exit
  else
    "Puts error, try again"
    main_menu
  end
end
end
