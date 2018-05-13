require_relative 'order'
require_relative 'menu_items'
require_relative 'food'

class Person
  attr_accessor :wallet, :cart, :name, :lunchlady, :menu_items

  def initialize(lunchlady, menu_items)
    @menu_items = menu_items
    @wallet = wallet
    @cart = cart
    @name = name
    @wallet = 30
    @cart = []
    order_start
  end

  def order_start
    puts "What is the name on your order?"
      @name = gets.strip
    puts
    puts "\t#{@name} you have $#{@wallet} to spend"
    puts
    instructions
  end

  def instructions
    puts "\t1) View the menu"
    puts "\t2) Place your order"
    puts "\t3) Add items to the menu"
    puts "\t4) Add some cash to your wallet"
    puts "\t5) Return to the main menu"
    choice
  end

  def choice
    choice = gets.strip.to_i
    case choice
      when 1
        @menu_items.view_food_menu
        instructions
      when 2
        Order.new(self, @menu_items)
      when 3
        Add.new(@menu_items)
        instructions
      when 4
        add
        instructions
      when 5
        @intro
      else
        puts "Invalid Selection, Try Again"
        order_start
      end
  end


  def add
    puts "You currently have $#{@wallet}, how much would you like to add?"
    add = gets.strip.to_i
      if add > 15 || @wallet > 50
        puts "Jeeze, you're kinda greedy. I think you should add less than that.".colorize(:red)
        add
      else
        puts "Okay, that seems reasonable, adding $#{add} to your wallet"
        @wallet = @wallet + add
        puts
        instructions
      end
  end
end
