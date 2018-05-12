require_relative 'menu_items'

require 'pry'

class MainDish
  attr_accessor :person, :menu_items, :cart

  def initialize(person, menu_items)
    @menu_items = menu_items
    @person = person
    main_order
  end

  def main_order
    puts "#{@person.name}, which of the following items would you like to add to your order?"
    @menu_items.list_main_dish
    user_choice = gets.strip.to_i
    @menu_items.pick_main(user_choice)
  end
end
