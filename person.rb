'require pry'
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
    puts "\t3) Return to the main menu"
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
        @intro
      else
        puts "Invalid Selection, Try Again"
        order_start
      end
    end
  end
