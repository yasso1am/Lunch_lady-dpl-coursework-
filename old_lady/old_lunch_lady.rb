# make a menu
# make a list of main items
# make a list of side items
# allow for user input twice
# print order
# confirm order
# compute cost
# total cost
@regexnumber = /^\d+(\.\d+)?$/
@order = []
@main_items = [
  {item: 'Steak', price: '22'},
  {item: 'Eggplant Parmesean', price: '14'},
  {item: 'Tikka Masala', price: '15'},
  {item: 'Chicken Salad', price: '13'},
  {item: 'Pad Thai', price: '13'},
  {item: 'Falafel', price: '12'},
]
@side_items = [
  {side_item: 'Baked Potato', price: '6'},
  {side_item: 'Side Salad', price: '5'},
  {side_item: 'Olives', price: '4'},
  {side_item: 'Calamari', price: '9'},
  {side_item: 'Green Beans', price: '7'},
  {side_item: 'Sauteed Mushrooms', price: '6'},
]

def list_main_items
  list_main_items = @main_items.each_with_index do |item, index|
    list_index = index + 1
    puts "\t#{list_index}] #{item[:item]}\:  $#{item[:price]}"
  end
end

def list_side_items
  list_side_items = @side_items.each_with_index do |item, index|
    list_index = index + 7
    puts "\t#{list_index}] #{item[:side_item]}\:  $#{item[:price]}"
  end
end

def get_main
  puts "What main dish would you like to add to #{@order_id}?"
  puts "Select using a number"
    list_main_items
      choice = gets.strip.to_i
      user_choice = choice - 1
        puts "Added #{@main_items[user_choice][:item]}, for $#{@main_items[user_choice][:price]} was that right? [Y/N]"
          verify = gets.strip
      if verify == 'Y' || verify == 'y'
        @order << user_choice
      else
      puts "Let's try again"
        get_main
      end
  get_side
end

def get_side
  puts "What main dish would you like to add to #{@order_id}?"
  puts "Select using a number"
end

def main_menu
  puts "\n"
  puts "Welcome to Chez Ruby"
  puts "\t1) View dinner the menu"
  puts "\t2) Start a new order"
  puts "\t3) View your order with total"
  puts "\t4) Quit"
  get_user_selection
end

def get_user_selection
  choice = gets.strip.to_i
  case choice
    when 1
      puts "\t\t--Main Dishes--\n"
      list_main_items
      puts "\t\t--Side Dishes--\n"
      list_side_items
    when 2
      puts "What would you like to call your order?"
      @order_id = gets.strip
      Order.new(@order_id)
      get_main
    when 3
      view_order
    when 4
      puts "Enjoy your meal"
      exit
    else
      puts "Invalid selection, try again"
    end
  main_menu
end
main_menu






# # class Order
#   attr_reader :name (read only)
#   attr_accessor :price (read/write access)
#   attr_writer: (write only)
#
#   def initialize(name, price)
#     @name = name
#     @price = price
#   end
