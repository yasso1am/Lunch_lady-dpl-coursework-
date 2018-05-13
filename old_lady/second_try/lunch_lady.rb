require_relative 'food'
require_relative 'menu_items'
require_relative 'person'
require 'pry'

@allorders = []
@order_id = ""
@wallet = [25]
@order = []
@person = NewPerson.new(@order, @wallet)


def list_main_dish
  @maindish.each_with_index do |food, index|
  list_index = index + 1
	puts "\t#{list_index}] #{food.dish} - $#{food.price}"
  end
end

def list_side_dish
  @sidedish.each_with_index do |food, index|
  list_index = index + 1
	puts "\t#{list_index}] #{food.dish} - $#{food.price}"
  end
end

def main_menu
    puts "\n"
    puts "Welcome to Chez DPL"
    puts "\t1) View the entire menu"
    puts "\t2) Start a new order"
    puts "\t3) View all pending orders"
    puts "\t4) Confirm orders and pay"
    puts "\t5) Quit"
    get_user_selection
end

def get_user_selection
  choice = gets.strip.to_i
  case choice
    when 1
      puts "\t\t--Main Dishes--\n"
      list_main_dish
      puts "\t\t--Side Dishes--\n"
      list_side_dish
    when 2
      create_new_order
    when 3
      view_all
    when 4
      confirm_order
    when 5
      puts "Enjoy your meal"
      exit
    else
      puts "Invalid selection, try again"
  end
  main_menu
end

def create_new_order
  puts "What do you want to call your order?"
    @order_id = gets.strip
  puts "Pick a main dish"
    list_main_dish
      main_select = gets.chomp.to_i - 1
    @person.order << @maindish[{main: main_select}]
  puts @order
end


main_menu
