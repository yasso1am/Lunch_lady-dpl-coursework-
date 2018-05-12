'require pry'
require_relative 'main_dish'
require_relative 'menu_items'
require_relative 'food'

class Person
  attr_accessor :wallet, :cart, :name, :lunchlady, :menu_items

  def initialize(lunchlady, menu_items)
    @menu_items = menu_items
    @wallet = wallet
    @cart = cart
    @name = name
    @wallet = 50
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
    puts "\t2) Choose your main dish"
    puts "\t3) Choose a few sides"
    puts "\t4) View order and confirm"
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
        MainDish.new(self, @menu_items)
      when 3
        SideDish.new(self)
      when 4
        @cart
      when 5
        @intro
      else
        puts "Invalid Selection, Try Again"
        order_start
      end
    end
  end
