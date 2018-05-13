require_relative 'person'
require_relative 'menu_items'

class LunchLady
  attr_accessor :person

  def initialize
    @person = person
    @menu_items = MenuItems.new
    intro
  end

  def intro
    puts
    puts "*" * 50
    puts "Welcome to the DPL Cafeteria"
    puts "1) Start a new order"
    puts "2) View the menu"
    puts "3) Exit"
    puts "*" * 50
    user_selection
  end

  def user_selection
    choice = gets.strip.to_i
    case choice
      when 1
        @person = Person.new(self, @menu_items)
      when 2
        @menu_items.view_food_menu
        intro
      when 3
        puts "Thanks for visiting"
        exit
      else
        puts "Invalaid selection, try again"
        user_selection
      end
    end
    LunchLady.new
  end
LunchLady.new
